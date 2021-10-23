import numpy as np
import tensorflow as tf
from PIL import Image

with open('vehicle_model.json', 'r') as json_file:
    json_savedModel = json_file.read()

# load the model architecture
model = tf.keras.models.model_from_json(json_savedModel)
model.load_weights('vehicle_weights.h5')
opt = tf.keras.optimizers.Adam(learning_rate=0.0001)
model.compile(optimizer=opt,loss="sparse_categorical_crossentropy", metrics=["accuracy"])

label = ['unknown', 'Head Lamp', 'Door Scratch', 'Glass Shatter', 'Tail Lamp', 'Bumper Dent', 'Door Dent', 'Bumper Scratch']


def classify_image(file_path):
    image = Image.open(file_path) # reading the image
    image = image.resize((224, 224))
    img = np.asarray(image) # converting it to numpy array
    img = np.expand_dims(img, 0)
    predictions = model.predict(img) # predicting the class
    return label[np.argmax(predictions[0])]
