

# Cat A Logger
## Purpose
Outdoor cats are present nearly everywhere in the world. Some regions allow them to roam freely, some want them vaccinated, and others want them to be spayed or neutered. Outdoor cats are notoriously difficult to track and manage without specialized equipment, personnel, training, and procedures.

This project proposes a solution using Deep Learning to keep track of outdoor cats. It can distinguish cats from other objects and ultimately allow the user to track metadata on individual cats.

Metadata can include but is not limited to: The coming and goings of a particular cat over time, their vaccination, health, and reproductive status.

## Project Structure
This project was broken into discrete processing units implemented primarily in [Jupyter Notebooks](https://jupyter.org/).  The project was broken up for several reasons:

 - The output of each stage can be evaluated
 - Discrete units can be incorporated into other projects
 - Code is easier to read and understand

Most of the notebooks and datasets have been made publicly available on Kaggle.  Everything else is in this repository.

- Crop Cats and Dogs YOLOv3 [Notebook](https://www.kaggle.com/bobbo1/crop-cats-and-dogs-yolov3) [Dataset](https://www.kaggle.com/bobbo1/cropped-cats-and-dogs){:target="_blank"}
- Augment Cats and Dogs YOLOv3 [Notebook](https://www.kaggle.com/bobbo1/augment-cats-and-dogs) [Dataset](https://www.kaggle.com/bobbo1/augmented-cats-and-dogs){:target="_blank"}
