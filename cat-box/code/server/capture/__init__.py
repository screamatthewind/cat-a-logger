import os
import cv2 
import time
import threading
from pathlib import Path

import config

class VideoCapture(object):

    video_in = None
    video_out = None

    width = None
    height = None

    start_time = None
    is_capturing = False


    def start_thread(self):
        self.video_in = cv2.VideoCapture(config.VIDEO_CAPTURE_SOURCE)

        self.width = int(self.video_in.get(cv2.CAP_PROP_FRAME_WIDTH))
        self.height = int(self.video_in.get(cv2.CAP_PROP_FRAME_HEIGHT))

        print(self.width, self.height)

        thread = threading.Thread(target=self.run, args=())
        thread.daemon = True
        thread.start()


    def run(self):
        while True:
            # print(datetime.datetime.now().__str__() + ' : Running task in the background')
            ret, frame = self.video_in.read()  

            if self.is_capturing == True:
                self.video_out.write(frame)  

                if (time.time() - self.start_time) > config.VIDEO_CAPTURE_SECS:
                    self.video_out.release()
                    self.is_capturing = False


    def start_capture(self):

        if self.is_capturing == False:

            timestr = time.strftime("%Y%m%d-%H%M%S")
            filename = config.VIDEO_CAPTURE_PREFIX + '-' + timestr + '.avi'

            data_folder = Path(config.VIDEO_CAPTURE_DIR)
            os.makedirs(data_folder, exist_ok=True)

            out_filename = str(data_folder / filename)

            fourcc = cv2.VideoWriter_fourcc(*'XVID')
            self.video_out = cv2.VideoWriter(out_filename, fourcc, 20.0, (self.width, self.height)) 

            self.start_time = time.time()
            self.is_capturing = True

        # video_in.release() 

vc = VideoCapture()