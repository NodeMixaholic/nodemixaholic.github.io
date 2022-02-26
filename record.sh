mkdir "bloatless-videos"

audioout="alsa_output.usb-Logitech_USB_Headset_Logitech_USB_Headset-00.analog-stereo.monitor"
audioin="alsa_input.usb-Logitech_USB_Headset_Logitech_USB_Headset-00.mono-fallback"

ffmpeg -f pulse -i $audioin -ac 1 -f mp3 - | ffplay - |  ffmpeg -f x11grab -thread_queue_size 64 -video_size 1920x1080 -framerate 60 -i :0.0 \
       -f v4l2 -thread_queue_size 64 -video_size 320x180 -framerate 30 -i /dev/video0 \
       -f pulse -i $audioout -ac 2 \
       -filter_complex 'overlay=main_w-overlay_w:main_h-overlay_h:format=yuv444' \
       -vcodec libx264 -preset ultrafast -qp 0 \
       "bloatless-videos/$1.mp4"
       
./update-videos-directory.sh