import os
import socket
import threading
from queue import Queue
import json
import time


class GMS2Client():
    client_queue: Queue             # Queue to transfer data from the subthread to the main thread.
    thread: threading.Thread        # Client thread to maintain client-server connection.

    def __init__(self):
        """
        Initializes client queue
        """
        self.client_queue = Queue()

        self.host = "127.0.0.1"
        self.port = 36042


    def start_thread(self) -> None:
        """
        Initialise & Start the Client thread.
        """

        self.thread = self.create_thread()
        self.thread.start()

    def create_thread(self) -> threading.Thread:
        """
        Create the Client thread.
        Returns: the client thread instance.
        """

        # ',' used in thread args to convert the single argument to a tuple.
        server_thread: threading.Thread
        server_thread = threading.Thread(
            target=self.handle_connection_tcp
        )
        return server_thread
    

    def handle_connection_tcp(self) -> bool:
        """
        Initialise the connection to the server.
        Handle message transmission between the client and server.
        """

        # Initialise the socket and bind it to the specified host, at the specified port.
        sock: socket.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

        sock.bind(( self.host, self.port ))
        print("listening")
        sock.listen()

        # Attempt connection to the server.
        try:
            conn: socket.socket
            conn, _ = sock.accept()

        except Exception as e:
            raise e

        with conn:  
            self.mainloop(conn)


    def mainloop(self, conn: socket.socket) -> None:
        """
        Send messages to the GMS2 server if any are queued, and receive messages from the server.
        """
        conn.settimeout(0.1)  # Set a small timeout to avoid blocking on recv
        while True:
            # Send messages if any are queued
            if not self.client_queue.empty():
                data: str = self.client_queue.get()
                print(f"sending: {data}")
                conn.send(bytes(data, encoding="UTF-8"))
            time.sleep(1)
            
        return None
    