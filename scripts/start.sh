#!/bin/sh
echo [RPI-RECORDER_START]
sh stop.sh | sed "s/^/\t/"
echo [Run]
docker \
  run \
  --name=rpi-recorder \
  -d \
  --privileged \
  -v /dev/video0:/dev/video0 \
  -v /home/pirate/rpi-recorder/out:/rpi-recorder/out \
  anaker/rpi-recorder
