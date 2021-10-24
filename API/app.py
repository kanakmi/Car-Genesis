from fastapi import FastAPI, File, UploadFile
from pydantic import BaseModel
from io import BytesIO
from PIL import Image
import numpy as np
import tensorflow as tf
import urllib.request

description = """
This API helps you detect damages in your car including - 
- Head Lamp
- Door Scratch
- Glass Shatter
- Tail Lamp
- Bumper Dent
- Door Dent
- Bumper Scratch

## How to use it?
- Send a POST request on [https://car-genesis.herokuapp.com/](https://car-genesis.herokuapp.com/) with a JSON file containing url of the image you want to classify.
- Alternatively, try uploading the image directly on this page using try-it-out functionality in predict_image route.

## Response Format
It will return you a string containing the defect identified. 

You are free to use this API in your own Applications. Please use it responsibly and consider giving a star on its GitHub Repo. 
"""

app = FastAPI(
    title="Car Genesis API",
    version="1.0",
    description=description,
    contact={
        "name": "Car Genesis",
        "url": "https://github.com/kanakmi/Car-Genesis"
    }
)

with open('./saved_model/vehicle_model.json', 'r') as json_file:
    json_savedModel = json_file.read()

# load the model architecture
model = tf.keras.models.model_from_json(json_savedModel)
model.load_weights('./saved_model/vehicle_weights.h5')
opt = tf.keras.optimizers.Adam(learning_rate=0.0001)
model.compile(optimizer=opt,loss="sparse_categorical_crossentropy", metrics=["accuracy"])

label = ['unknown', 'Head Lamp', 'Door Scratch', 'Glass Shatter', 'Tail Lamp', 'Bumper Dent', 'Door Dent', 'Bumper Scratch']

def classify_image(arr):
    img = arr.astype('Float32')
    img = img/255
    img = img.reshape((1, 224, 224, 3))
    predictions = model.predict(img) # predicting the class
    return label[np.argmax(predictions[0][1:])]

class img_url(BaseModel):
    url: str

    class Config:
        schema_extra = {
            "example": {
                "url" : "https://i.ibb.co/34JNt9m/6.jpg"
            }
        }

@app.get("/ping")
async def ping():
    return "Hello, I am alive"

def read_file_as_image(data) -> np.ndarray:
    image = Image.open(BytesIO(data))
    image = image.convert("RGB")
    image = image.resize((224, 224))
    return np.array(image)

@app.post("/predict_image")
async def predict(
    file: UploadFile = File(...)
):
    image = read_file_as_image(await file.read())
    response = classify_image(image)
    return response

@app.post(
    "/",
    responses={
        200: {
            "description": "Successful Response",
            "content": {
                "application/json": {
                    "example": {
                        "Glass Shatter"
                    }
                }
            }
        }
    }
)
async def classify_url(item: img_url):
    req = urllib.request.urlretrieve(item.url, "saved")
    image = Image.open("saved")
    image = image.convert("RGB")
    image = image.resize((224, 224))
    image = np.array(image)
    response = classify_image(image)
    return response