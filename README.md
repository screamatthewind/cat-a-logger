

# Cat A Logger (Under Construction)
## Purpose
Outdoor cats are present nearly everywhere in the world. Some regions allow them to roam freely, some want them vaccinated, and others want them to be spayed or neutered. Outdoor cats are notoriously difficult to track and manage without specialized equipment, personnel, training, and procedures.

This project proposes a solution using Deep Learning to keep track of outdoor cats. It can distinguish cats from other objects and ultimately allow the user to track metadata on individual cats.

Metadata can include but is not limited to: The coming and goings of a particular cat over time, their vaccination, health, and reproductive status.

Checkout the [Slide Presentation](https://github.com/screamatthewind/cat-a-logger/blob/main/Slide%20Presentation.pdf).  It contains a lot of information including the BOM's and wiring diagrams.

## Inferencing Engine

## Model Builder Project Structure
The code to build the model was broken into discrete processing units implemented primarily in [Jupyter Notebooks](https://jupyter.org/).  

The project was broken up for several reasons:

 - The output of each stage can be evaluated
 - Discrete units can be incorporated into other projects
 - Code is easier to read, understand, and debug
 - It takes a long time and a lot of horsepower to perform all of the operations
 
The majority of the processing for the model was done on an [NVIDIA 3080 GPU](https://www.nvidia.com/)

Most of the notebooks and datasets have been made publicly available on [Kaggle](https://www.kaggle.com).  Everything else is in this repository.

- Crop Cats and Dogs YOLOv3 [Notebook](https://www.kaggle.com/screamatthewind/crop-cats-and-dogs-yolov3) [Dataset](https://www.kaggle.com/screamatthewind/cropped-cats-and-dogs)  
- Augment Cats and Dogs YOLOv3 [Notebook](https://www.kaggle.com/screamatthewind/augment-cats-and-dogs) [Dataset](https://www.kaggle.com/screamatthewind/augmented-cats-and-dogs)  
- Randomize Background for Cats and Dogs [Notebook](https://www.kaggle.com/screamatthewind/randomize-backgrounds-for-cats-and-dogs) [Dataset](https://www.kaggle.com/screamatthewind/random-backgrounds-for-cats-and-dogs)  
