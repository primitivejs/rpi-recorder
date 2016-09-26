#rpi-recorder
FROM snowballone/rpi-python-opencv
#create the working directory
RUN mkdir -p /rpi-recorder/out
VOLUME /rpi-recorder/out
WORKDIR /rpi-recorder
#avoid "libdc1394 error: Failed to initialize libdc1394"
RUN ln /dev/null /dev/raw1394
#copy the python script
COPY ./run.py /rpi-recorder/run.py
#start the video capture
ENTRYPOINT python run.py
