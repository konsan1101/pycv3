#!/bin/bash
cd /home/pi/pycv
#pgrep -f ".py" | xargs kill

export ALSADEV="plughw:1,0"
amixer -c1 sset Mic,0 62
amixer -c0 sset PCM,0 400

python3 azure_capture.py 0 0 google google face.xml fullbody.xml None 0



