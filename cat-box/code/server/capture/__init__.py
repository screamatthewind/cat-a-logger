import numpy as np 
import cv2 
  
video_in = cv2.VideoCapture("rtsp://10.0.0.62:554/11")
    

width = int(video_in.get(cv2.CAP_PROP_FRAME_WIDTH))
height = int(video_in.get(cv2.CAP_PROP_FRAME_HEIGHT))

fourcc = cv2.VideoWriter_fourcc(*'XVID')
video_out = cv2.VideoWriter('output.avi', fourcc, 20.0, (width, height)) 

while(True): 
    ret, frame = video_in.read()  
  
    video_out.write(frame)  
      
    cv2.imshow('Original', frame) 
      
    # Wait for 'a' key to stop the program  
    if cv2.waitKey(1) & 0xFF == ord('a'): 
        break
  
video_in.release() 
video_out.release()
  
cv2.destroyAllWindows() 