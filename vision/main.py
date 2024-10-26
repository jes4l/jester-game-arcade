import argparse
import cv2
from cvzone.HandTrackingModule import HandDetector
from cvzone.ClassificationModule import Classifier
import numpy as np
import math
import time

from pynput.keyboard import Key, Controller


# Arg parse
parser = argparse.ArgumentParser(description="spookyArcadeVis")
parser.add_argument('-g', action="store", dest="game", default="N/A")
args = parser.parse_args()
chosenGame = args.game
print(f"[INFO] - Now playing... {chosenGame}.")

labels = []
controlSet = {}
modelPath = ""
labelPath = ""
if chosenGame == "N/A":
    print("[ERROR] - No game chosen?")
    exit(1)
elif chosenGame == "Dino":
    labels = ["leftJump", "leftNothing", "rightJump", "rightNothing"]
    controlSet = { "0": Key.space, "2": Key.space }
    modelPath = "vision/Model/keras_model.h5.Dino"
    labelPath = "vision/Model/labels.txt.Dino"
elif chosenGame == "ghostRunner":
    labels = ["left", "right"]
    controlSet = { "0": Key.left, "1": Key.right }
    modelPath = "vision/Model/keras_model.h5.ghostRunner"
    labelPath = "vision/Model/labels.txt.ghostRunner"

# Model and detector init
cap = cv2.VideoCapture(0)
detector = HandDetector(maxHands=1)
classifier = Classifier(modelPath, labelPath)
offset = 20
imgSize = 300
keyboard = Controller()

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
        if imgCrop.size > 0:
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
                for k, v in controlSet.items():
                    # Dino game mapping
                    if k == str(index):
                        keyboard.press(v)
                        keyboard.release(v)
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
    cv2.waitKey(1)
