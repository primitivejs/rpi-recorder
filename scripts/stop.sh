#!/bin/sh
echo [RPI-RECORDER_STOP]
echo [Stop]
docker \
  ps \
  -aq \
  -f name=rpi-recorder \
  | xargs -r -I % docker rm -f %
