import time
from queue import Queue
import threading
import json
import cv2
from cvzone.HandTrackingModule import HandDetector
from cvzone.ClassificationModule import Classifier
import numpy as np
import math
import time

# OSError: No file or directory found at Model/keras_model.h5

class CVHandler():
    stop_event: threading.Event      # Event to signal the termination of the thread.
    message_queue: Queue             # Queue to transfer data from the subthread to the main thread.
    thread: threading.Thread         # Thread to continously retrieve gestures from webcam input.

    def __init__(self):
        """
        Initialise the stop event and gesture queue.
        """
        self.message_queue = Queue()
        self.message = {}



        self.cap = cv2.VideoCapture(0)
        self.detector = HandDetector(maxHands=1)
        self.classifier = Classifier("./Model/keras_model.h5", "./Model/labels.txt")
        self.offset = 20
        self.imgSize = 300

        self.folder = "../data/left/el"
        self.counter =  0

        self.labels = ["al", "bl", "cl", "dl", "el"]
        


    def send_messages(self, queue) -> None:
        # TODO : INTEGRATE SIGN LANGUAGE
        while True:
            sign = self.get_sign()
            if sign is None:
                continue
            self.message["data"] = self.labels[sign]
            message_json = json.dumps(self.message)
            queue.put(message_json)
            time.sleep(0.01)

    def get_sign(self) -> int:
        
        success, img = self.cap.read()
        imgOutput = img.copy()
        hands, img = self.detector.findHands(img) # creates dots on hands
        if hands:

            hand = hands[0] # Having one hand
            # Crop image for classification
            x, y, w, h = hand['bbox']

            imgWhite = np.ones((self.imgSize, self.imgSize, 3),np.uint8)*255
            imgCrop = img[y - self.offset:y + h + self.offset, x - self.offset:x + w + self.offset]

            imgCropShape = imgCrop.shape

            aspectRatio = h/w

            if aspectRatio >1:
                k = self.imgSize/h
                wCal = math.ceil(k * w)
                imgResize = cv2.resize(imgCrop, (wCal, self.imgSize))
                imgResizeShape = imgResize.shape
                wGap = math.ceil((self.imgSize - wCal)/2)
                # put image crop matrix inside image white matrix
                imgWhite[:, wGap:wCal+wGap] = imgResize
                prediction, index = self.classifier.getPrediction(imgWhite, draw=False)
                #print(prediction, index)

            else:
                k = self.imgSize/w
                hCal = math.ceil(k * h)
                imgResize = cv2.resize(imgCrop, (self.imgSize, hCal))
                imgResizeShape = imgResize.shape
                hGap = math.ceil((self.imgSize - hCal)/2)
                # put image crop matrix inside image white matrix
                imgWhite[hGap:hCal+hGap] = imgResize
                prediction, index = self.classifier.getPrediction(imgWhite, draw=False)

            cv2.rectangle(imgOutput, (x - self.offset, y - self.offset - 50), (x - self.offset + 90, y - self.offset -50 + 50), (255, 0, 255), cv2.FILLED)
            cv2.putText(imgOutput, self.labels[index],(x,y-26),cv2.FONT_HERSHEY_COMPLEX,1.7,(255,255,255),2)
            cv2.rectangle(imgOutput, (x - self.offset,y - self.offset), (x + w+self.offset, y + h+self.offset), (255,0,255), 4)

            cv2.imshow("imageCrop", imgCrop)
            cv2.imshow("imageWhite", imgWhite)

            cv2.waitKey(1)

            #print(f"prediction : {prediction} index :{index} imgoutput: {imgOutput}")

            return index
        

        cv2.imshow("Image",imgOutput)
        cv2.waitKey(1)

