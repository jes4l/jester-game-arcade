import cv2
from cvzone.HandTrackingModule import HandDetector
from cvzone.ClassificationModule import Classifier
import numpy as np
import math
import time

from pynput.keyboard import Key, Controller

cap = cv2.VideoCapture(0)
detector = HandDetector(maxHands=1)
classifier = Classifier("Model/keras_model.h5", "Model/labels.txt")
offset = 20
imgSize = 300
keyboard = Controller()

labels = ["leftJump", "leftNothing", "rightJump", "rightNothing"]
while True:
    success, img = cap.read()
    imgOutput = img.copy()
    hands, img = detector.findHands(img) # creates dots on hands
    if hands:
        hand = hands[0] # Having one hand
        # Crop image for classification
        x, y, w, h = hand['bbox']

        imgWhite = np.ones((imgSize, imgSize, 3),np.uint8)*255
        imgCrop = img[y - offset:y + h + offset, x - offset:x + w + offset]

        imgCropShape = imgCrop.shape

        aspectRatio = h/w

        if aspectRatio >1:
            k = imgSize/h
            wCal = math.ceil(k * w)
            imgResize = cv2.resize(imgCrop, (wCal, imgSize))
            imgResizeShape = imgResize.shape
            wGap = math.ceil((imgSize - wCal)/2)
            # put image crop matrix inside image white matrix
            imgWhite[:, wGap:wCal+wGap] = imgResize
            prediction, index = classifier.getPrediction(imgWhite, draw=False)
            print(prediction, index)
            if index == 0 or index == 2:
                print("SPPPPAACCCEEE")
                keyboard.press(Key.space)
                keyboard.release(Key.space)

        else:
            k = imgSize/w
            hCal = math.ceil(k * h)
            imgResize = cv2.resize(imgCrop, (imgSize, hCal))
            imgResizeShape = imgResize.shape
            hGap = math.ceil((imgSize - hCal)/2)
            # put image crop matrix inside image white matrix
            imgWhite[hGap:hCal+hGap] = imgResize
            prediction, index = classifier.getPrediction(imgWhite, draw=False)

        cv2.rectangle(imgOutput, (x - offset, y - offset - 50), (x - offset + 90, y - offset -50 + 50), (255, 0, 255), cv2.FILLED)
        cv2.putText(imgOutput, labels[index],(x,y-26),cv2.FONT_HERSHEY_COMPLEX,1.7,(255,255,255),2)
        cv2.rectangle(imgOutput, (x - offset,y - offset), (x + w+offset, y + h+offset), (255,0,255), 4)

        cv2.imshow("imageCrop", imgCrop)
        cv2.imshow("imageWhite", imgWhite)

    cv2.imshow("Image",imgOutput)
    cv2.waitKey(1)
