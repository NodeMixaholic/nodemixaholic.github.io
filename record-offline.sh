mkdir "bloatless-videos"

audioout="alsa_output.pci-0000_00_1b.0.analog-stereo.monitor"
audioin="alsa_input.pci-0000_00_1b.0.analog-stereo"

ffmpeg -f pulse -i $audioin -ac 1 -f mp3 - | ffplay - |  ffmpeg -f x11grab -thread_queue_size 450 -video_size 900x506 -framerate 60 -i :0.0 \
       -f v4l2 -thread_queue_size 64 -video_size 320x180 -framerate 30 -thread_queue_size 225 -i /dev/video0 \
       -f pulse -i $audioout -ac 2 \
       -filter_complex 'overlay=main_w-overlay_w:main_h-overlay_h:format=yuv444' \
       -vcodec libx264 -preset ultrafast -qp 0 \
       "bloatless-videos/$1.mp4"
       
