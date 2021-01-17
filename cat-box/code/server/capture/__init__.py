import os
import cv2 
import time
import logging
import threading
from pathlib import Path

import config

class VideoCapture(object):

    video_in = None
    video_out = None

    width = None
    height = None

    start_time = None
    extended_time = None

    is_capturing = False
    thread_lock = threading.Lock()

    logger = logging.getLogger(__name__)

    def start_thread(self):
        self.video_in = cv2.VideoCapture(config.VIDEO_CAPTURE_SOURCE)

        self.width = int(self.video_in.get(cv2.CAP_PROP_FRAME_WIDTH))
        self.height = int(self.video_in.get(cv2.CAP_PROP_FRAME_HEIGHT))

        self.logger.info(f"Capture Size: {self.width} x {self.height}")

        thread = threading.Thread(target=self.run, args=())
        thread.daemon = True
        thread.start()


    def run(self):
        while True:
            ret, frame = self.video_in.read()  

            if self.is_capturing == True:
                self.video_out.write(frame)  

                if (time.time() - self.extended_time) > config.VIDEO_CAPTURE_SECS:
                    with self.thread_lock:
                        self.video_out.release()
                        self.is_capturing = False
        
                    self.logger.info("Capture stopped")


    def start_capture(self):

        if self.is_capturing == False:

            self.logger.info("Capture started")

            timestr = time.strftime("%Y%m%d-%H%M%S")
            filename = config.VIDEO_CAPTURE_PREFIX + '-' + timestr + '.avi'

            data_folder = Path(config.VIDEO_CAPTURE_DIR)
            os.makedirs(data_folder, exist_ok=True)

            out_filename = str(data_folder / filename)

            fourcc = cv2.VideoWriter_fourcc(*'XVID')

            with self.thread_lock:

                self.video_out = cv2.VideoWriter(out_filename, fourcc, 20.0, (self.width, self.height)) 

                self.start_time = time.time()
                self.extended_time = self.start_time
                self.is_capturing = True

        elif (time.time() - self.start_time) < config.VIDEO_CAPTURE_MAX_SECS:
            self.logger.info("Capture extended")
            self.extended_time = time.time()

        else:
            self.logger.info("Cannot extend capture")

        # video_in.release() 

vc = VideoCapture()