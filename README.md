# Car Genesis

## 💡 Inspiration

Have you ever spent hours in line waiting for your turn to get your car repaired? Isn't it a pain in the neck? <br>
One of the primary reasons for the delay is that everyone who visits wants an estimate of how much they might have to pay. <br>
Our project aims to reduce this time.

## 💻 What it does

Car Genesis analyses user's car for damages such as -
- Head Lamp
- Door Scratch
- Glass Shatter
- Tail Lamp
- Bumper Dent
- Door Dent
- Bumper Scratch

All the user has to do is choose where they live and upload some images of their car (min 1, max 4). <br>
The ML model in the backend will analyse the car damages and the Android App / Web-App would show the estimated price and time for repair. <br>

## 🌟 Our Vision

Just like when people put items in their shopping trolley at a wallmart store, people should be able to drive through the Garage's entrance and a screen or mobile app
should be able to give them estimated repair cost. <br>
Alternatively, people should be able to calculate estimated repair cost all by themselves using our app.

## ⚙️How we built it
- <b> Android App </b>: <img alt="Flutter" width="8%" src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white" />
- <b> API </b>: <img alt="Fast API" width="8%" src="https://img.shields.io/badge/FastAPI-005571?style=for-the-badge&logo=fastapi" />
- <b> Backend </b>: <img alt="Django" width="8%" src="https://img.shields.io/badge/django-%23092E20.svg?style=for-the-badge&logo=django&logoColor=white" />
- <b> Frontend </b>: <img alt="HTML" width="8%" src="https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white" /> <img alt="CSS" width="7%" src="https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white" /> <img alt="JS" width="11.7%" src="https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E" />
- <b> ML </b>: <img alt="Python" width="8%" src="https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54" /> <img alt="TensorFlow" width="11%" src="https://img.shields.io/badge/TensorFlow-%23FF6F00.svg?style=for-the-badge&logo=TensorFlow&logoColor=white" />

## 🧠 Challenges we ran into

There was huge imbalance in the dataset that we opted for. We tried to train the model again and again but the performance was unsatisfactory. <br>
We tackled this problem by applying Image Augmentation on images with selected labels. <br>
The model that we built from scratch was only able to produce an accuracy of around 60% so we performed Transfer Learning using MobileNetV2 instead for a better accuracy of around 80% and smaller size so that it could be directly deployed on edge devices. <br>
<br>
We had a hard time connecting Android App with Fast API server as well that we tackled by replacing the package for POST request.

## 🏅 Accomplishments that we're proud of

We feel accomplished to come up with such an innovative idea that can have real impact on people's lives and successfully implementing it in such a short frame of time.

## 📖 What we learned

- We learnt about the ways we could use to perform multi-label classification.
- This is the first time we collaborated with an APP developer which was a fun and learning experience as well.

## 🚀 What's next for Car Genesis

- Improving the accuracy of the model
- Adding a tab where people can see quick-fix/DIY videos for above stated car defects 

## Installing and Running

1. Web App - 
Go to the backend folder and run
```
pip install -r requirements.txt
python manage.py runserver
```

2. Android App -
Download Car Genesis.apk and install it on your android device now.
