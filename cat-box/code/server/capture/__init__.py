import cv2 
import threading

class VideoCapture(object):

    video_in = None
    video_out = None
    width = None
    height = None
    capture = False

    def start_thread(self):
        self.video_in = cv2.VideoCapture("rtsp://10.0.0.62:554/11")

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

            if self.capture == True:
                ret, frame = self.video_in.read()  
                self.video_out.write(frame)  


# https://stackoverflow.com/questions/52655841/opencv-python-multithreading-seeking-within-a-videocapture-object

    def start_capture(self):
        self.capture = True;
        fourcc = cv2.VideoWriter_fourcc(*'XVID')
        self.video_out = cv2.VideoWriter('output.avi', fourcc, 20.0, (self.width, self.height)) 

        # video_in.release() 
        # video_out.release()
        
        # cv2.destroyAllWindows() 

vc = VideoCapture()