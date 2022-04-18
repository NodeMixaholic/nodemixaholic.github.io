echo LRLSD - LightRecorder List Device
echo Your possible output device:
pactl list | grep -A2 'Source #' | grep 'Name: ' | cut -d" " -f2 | grep ".monitor"
echo Your possible input devices:
pactl list | grep -A2 'Source #' | grep 'Name: ' | cut -d" " -f2 | grep -v ".monitor"
