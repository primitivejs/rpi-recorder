#from http://docs.opencv.org/3.0-beta/doc/py_tutorials/py_gui/py_video_display/py_video_display.html#saving-a-video
import numpy as np
import cv2
import os
import time

print '===================='
print '[RPI-RECORDER]'
print '===================='

#constants
FRAMERATE=30.0 #frames/second
RESOLUTION=(640, 480)
SEGMENT_FRAMES=FRAMERATE*60 #frames (1 minute)
SECTION_SEGMENTS=60 #segments (1 hour)
OUTPUT_PATH='out/'
DATE_PREFIX=time.strftime('%Y.%m.%d_%H.%M.%S')
#initialize
capture=cv2.VideoCapture(0)
fourcc=cv2.cv.CV_FOURCC(*'XVID')
section_count=0
while(True):
    folder=OUTPUT_PATH+'{}_{:05d}/'.format(DATE_PREFIX, section_count)
    os.mkdir(folder) #make directory
    segment_count=0
    while(segment_count<SECTION_SEGMENTS):
        filename='{}_{:05d}_{:05d}.avi'.format(DATE_PREFIX, section_count, segment_count)
        path=folder+filename
        print path
        output=cv2.VideoWriter(path, fourcc, FRAMERATE, RESOLUTION)
        frame_count=0
        while(frame_count<SEGMENT_FRAMES):
            (ret, frame)=capture.read()
            output.write(frame)
            frame_count=frame_count+1
        output.release()
        segment_count=segment_count+1
    section_count=section_count+1
