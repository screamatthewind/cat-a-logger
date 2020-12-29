# Python program to illustrate  
# saving an operated video 
  
# organize imports 
import numpy as np 
import cv2 
  
# This will return video from the first webcam on your computer. 
# video_in = cv2.VideoCapture(0)   
video_in = cv2.VideoCapture("rtsp://10.0.0.62:554/11")
    

width = int(video_in.get(cv2.CAP_PROP_FRAME_WIDTH))
height = int(video_in.get(cv2.CAP_PROP_FRAME_HEIGHT))

  
# Define the codec and create VideoWriter object 

#height, width, channels = frame.shape
fourcc = cv2.VideoWriter_fourcc(*'XVID')
video_out = cv2.VideoWriter('output.avi', fourcc, 20.0, (width, height)) 

# fourcc = cv2.VideoWriter_fourcc(*'XVID') 
# out = cv2.VideoWriter('output.avi', fourcc, 20.0, (640, 480)) 
  
# loop runs if capturing has been initialized.  
while(True): 
    # reads frames from a camera  
    # ret checks return at each frame 
    ret, frame = video_in.read()  
  
    video_out.write(frame)  
      
    # The original input frame is shown in the window  
    cv2.imshow('Original', frame) 
      
    # Wait for 'a' key to stop the program  
    if cv2.waitKey(1) & 0xFF == ord('a'): 
        break
  
# Close the window / Release webcam 
video_in.release() 
video_out.release()
  
# After we release our webcam, we also release the out-out.release()  
  
# De-allocate any associated memory usage  
cv2.destroyAllWindows() 