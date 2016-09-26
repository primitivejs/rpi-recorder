#!/bin/sh
echo [RPI-RECORDER_RESET]
sh stop.sh | sed "s/^/\t/"
echo [Reset]
sudo rm -rf ../out/
mkdir ../out/
