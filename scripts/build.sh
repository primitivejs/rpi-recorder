#!/bin/sh
echo [RPI-RECORDER_BUILD]
sh stop.sh | sed "s/^/\t/"
echo [Build]
docker \
  build \
  -t anaker/rpi-recorder \
  ../
