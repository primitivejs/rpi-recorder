#!/bin/sh
echo [RPI-RECORDER_REMOVE]
sh stop.sh | sed "s/^/\t/"
echo [Remove]
docker \
  rmi \
  -f \
  anaker/rpi-recorder
