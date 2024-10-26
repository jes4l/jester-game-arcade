from Python.cv_client import GMS2Client
from Python.computer_vision_here import CVHandler
from queue import Queue

class MessageController():
    client: GMS2Client                              # An instance of the cv_client.Client object (communicates to GMS2 server)
    client_queue: Queue                             # An instance of the client queue. Facilitates sending gesture data to the client object.
    gesture_queue: Queue                            # An instance of the CV queue. Allows transmission of data to the client.

    def __init__(self) -> None:

        self.create_client()
        self.init_cv()

        
    def create_client(self) -> None:
        """
        Creates a thread which initialises the client.
        """

        self.client = GMS2Client()
        self.client_queue: Queue = self.client.client_queue
        self.client.start_thread()

    def init_cv(self) -> None:
        """
        Creates a thread which initialises the gesture recognition.
        """

        self.gesture_recognizer = CVHandler()
        #self.message_queue: Queue = self.gesture_recognizer.message_queue
        #self.gesture_recognizer.start_thread()
        self.gesture_recognizer.send_messages(self.client_queue)

    def mainloop(self) -> None:
        """
        Program Main Loop. Retrieves gesture detections and sends them to GameMaker server.
        """
        while True:
            self.update_client()
            
    def update_client(self) -> None:
        """
        Attempt to update the client.
        """
        try:
            self.try_transmit_to_client()
        except Exception as e:
            raise e

    def try_transmit_to_client(self) -> bool:
        """
        Attempt to send the most recent gesture from gesture_queue to the GMS2 server.
        """

        if not self.message_queue.empty():
            messages: str = self.message_queue.get()
            self.client_queue.put(messages)
            return True
        else:
            return False
