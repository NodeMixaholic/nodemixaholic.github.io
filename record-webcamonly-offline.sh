mkdir "bloatless-videos"

audioout="alsa_output.pci-0000_00_1b.0.analog-stereo.monitor"
audioin="alsa_input.pci-0000_00_1b.0.analog-stereo"

ffmpeg -f pulse -i $audioin -ac 1 -f mp3 - | ffplay - |  ffmpeg -f v4l2 -thread_queue_size 64 -video_size 640x360 -framerate 30 -i /dev/video0 \
       -f pulse -i $audioout -ac 2 \
       -vcodec libx264 -preset ultrafast -qp 0 \
       "bloatless-videos/$1.mp4"
       
