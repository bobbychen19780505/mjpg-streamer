#!/bin/sh

export LD_LIBRARY_PATH=/usr/local/lib/mjpg-streamer

if [ "$1" != "" ]; then
	mkdir -p /tmp/mjpg-streamer
	mjpg_streamer -i "/usr/local/lib/mjpg-streamer/input_file.so -f /tmp/mjpg-streamer" -o "/usr/local/lib/mjpg-streamer/output_http.so -w /usr/local/share/mjpg-streamer/www" &

    while true; do
		ffmpeg -i $1 -y -q:v 1 -update 1 /tmp/mjpg-streamer/image.jpg
    done

else
    echo "Usage: $0 video_file"
    return 0
fi

exit 0

