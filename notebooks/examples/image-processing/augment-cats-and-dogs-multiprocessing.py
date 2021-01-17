https://awesomeopensource.com/project/stratospark/keras-multiprocess-image-data-generator
https://www.tensorflow.org/guide/data_performance
https://github.com/Ximilar-com/tf-image
https://www.wouterbulten.nl/blog/tech/data-augmentation-using-tensorflow-data-dataset/#code

# first run on 12/22/2020 3 hrs 11 mins
# 62K input images, 580K output images
# All CPU's were at 100%
# This was actually the 2nd run.  First run started on 12/20 and was killed after 22 hours 18 mins and 360,816 outputs.  
# It was single threaded.  CPU was poking along at around 10%
# 120 images / minute vs 3 images / minute

import os

# are we running locally or in kaggle?
if os.environ.get("KAGGLE_KERNEL_RUN_TYPE", "") == "":
    # print("We are running code on Localhost")
    isLocalhost = True

else:
    # print("We are running in Kaggle")
    isLocalhost = False

if isLocalhost:
    # INPUT_FILES = '../output/cropped-cats-and-dogs/*.jpg'
    INPUT_FILES = "../output/cropped-cats-and-dogs/*.jpg"

else:
    INPUT_FILES = "/kaggle/input/cropped-cats-and-dogs/*.jpg"

    from kaggle_secrets import UserSecretsClient

    user_secrets = UserSecretsClient()

    USER_ID = user_secrets.get_secret("user-id")
    API_TOKEN = user_secrets.get_secret("api-token")

OUTPUT_DATASET_ID = "augmented-cats-and-dogs"
OUTPUT_DATASET_NAME = "Augmented Cats and Dogs"
OUTPUT_PATH = "./output/augmented-cats-and-dogs-multiprocessing"

NUM_AUGMENTATIONS = 10

# final image size
# Same size is used in Crop Cats and Dogs
X_SIZE = 224
Y_SIZE = 224

import os

if not os.path.exists(OUTPUT_PATH):
    os.makedirs(OUTPUT_PATH)

# if pad == True, maintain aspect ratio and pad images otherwise just rescale
def image_resize(image, x_size, y_size, pad):

    if pad:
        new_image = np.zeros((y_size, x_size, 3), np.uint8)
        new_image[:, 0:x_size] = (0, 255, 0)  # (B, G, R) -- pure green padding

        w, h, c = image.shape

        if w > h:
            scale_factor = x_size / w
        else:
            scale_factor = y_size / h

        image = cv2.resize(image, (0, 0), fx=scale_factor, fy=scale_factor)

        x_offset = int((x_size - image.shape[1]) / 2)
        y_offset = int((y_size - image.shape[0]) / 2)

        new_image[
            y_offset : y_offset + image.shape[0], x_offset : x_offset + image.shape[1]
        ] = image

        return new_image

    else:
        image = cv2.resize(image, (x_size, y_size))
        return image


import os
import cv2
import time
import imageio
import numpy as np
import matplotlib.pyplot as plt

from imutils import paths

from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split
from tensorflow.keras.preprocessing.image import ImageDataGenerator
from tensorflow.keras.preprocessing.image import img_to_array
from tensorflow.keras.preprocessing.image import load_img
from tensorflow.keras.utils import to_categorical

# remove all masking artifacts from image
# very slow and inefficient, could be done better
from PIL import Image, ImageDraw


def mask_alpha(img):

    RED, GREEN, BLUE, ALPHA = (0, 1, 2, 3)

    x, y, c = img.shape
    alpha_channel = np.zeros([x, y])

    for i in range(x):

        for j in range(y):

            r = img[i][j][RED]
            g = img[i][j][GREEN]
            b = img[i][j][BLUE]

            if (r == 0.0 and g == 0.0 and b == 0.0) or (
                r == 0.0 and g == 1.0 and b == 0.0
            ):
                alpha_channel[i][j] = 0.0
            else:
                alpha_channel[i][j] = 1.0

    # erode mask to get rid of more of the green screen
    kernel = np.ones((5, 5), np.uint8)
    alpha_channel = cv2.erode(alpha_channel, kernel, iterations=1)
    alpha_channel = np.expand_dims(alpha_channel, axis=2)

    img = np.concatenate((img, alpha_channel), axis=2)

    # crop image using alpha mask
    pil_img = Image.fromarray((img * 255).astype(np.uint8))
    mask = Image.new("RGBA", pil_img.size, (0, 0, 0, 0))
    bbox_image = Image.composite(pil_img, mask, pil_img)
    bbox = bbox_image.convert("RGBa").getbbox()
    pil_img = pil_img.crop(bbox)
    img = np.array(pil_img)

    return img


def augmentImages(data, filenames):

    # init augmentor
    aug = ImageDataGenerator(
        rotation_range=20,
        zoom_range=0.15,
        width_shift_range=0.2,
        height_shift_range=0.2,
        shear_range=0.15,
        horizontal_flip=True,
        fill_mode="constant",
        cval=0,
    )

    file_num = 0

    # we need to break the loop by hand because the generator loops indefinitely
    batch_ctr = 0

    for images, labels in aug.flow(data, filenames, batch_size=NUM_AUGMENTATIONS):

        batch_ctr += 1
        if batch_ctr >= NUM_AUGMENTATIONS:
            break

        for i in range(images.shape[0]):

            img = images[i]
            img = mask_alpha(img)

            file_num = file_num + 1
            filename = labels[i] + "-" + str(file_num) + ".png"

            imageio.imwrite(OUTPUT_PATH + "/" + filename, img)
            # print(filename)


def processFile(imagePath):

    data = []
    filenames = []

    label = imagePath.split(os.path.sep)[-2]
    image = cv2.imread(imagePath)
    image = image_resize(image, X_SIZE, Y_SIZE, True)
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)  # switch the color oder

    # output original image as png with mask removed
    original_image = np.array(image, dtype="float") / 255.0
    original_image = mask_alpha(original_image)

    filename, file_extension = os.path.splitext(os.path.basename(imagePath))
    imageio.imwrite(OUTPUT_PATH + "/" + filename + "-original.png", original_image)
    # print(filename + "-original.png")

    # update the data and labels lists, respectively
    data.append(image)
    filenames.append(filename)

    # convert the data into a NumPy array, then preprocess it by scaling all pixel intensities to the range [0, 1]
    np_data = np.array(data, dtype="float") / 255.0

    # perform augmentation on batch of images
    augmentImages(np_data, filenames)

    # return filename


import time
import glob
import multiprocessing as mp


def main():
    start_time = time.time()

    # for filename in glob.iglob(INPUT_FILES):
    #    processFile(filename)

    pool = mp.Pool(mp.cpu_count())
    pool.map(processFile, glob.iglob(INPUT_FILES))

    # result = pool.map(processFile, glob.iglob(INPUT_FILES))
    # print(result)

    run_time = time.time() - start_time
    print("Done Augmenting Images - Total Time: {:.1f}".format(run_time) + " Secs")


if __name__ == "__main__":
    main()
