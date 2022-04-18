mkdir "bloatless-videos"

audioout="alsa_output.usb-Logitech_USB_Headset_Logitech_USB_Headset-00.analog-stereo.monitor"
audioin="alsa_input.usb-Logitech_USB_Headset_Logitech_USB_Headset-00.mono-fallback"

echo We are starting the recording!
ffmpeg -f pulse -i $audioin -ac 1 -f mp3 - | ffplay - |  ffmpeg -f v4l2 -thread_queue_size 64 -video_size 400x225 -framerate 30 -i /dev/video0 \
       -f pulse -i $audioout -ac 2 \
       -vcodec libx264 -preset ultrafast -qp 0 \
       "bloatless-videos/$1.smallfinal.mp4"
