#!/bin/bash

ffmpeg -re -i "http://${BIRDBOX_IP}:${BIRDBOX_PORT}/ts.m3u8" -vf "drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf: \
text='%{localtime\:%T} UTC': fontcolor=white@0.8: x=7: y=450" -vcodec libx264 -r 15 -g 30 -s 1024x480 -preset veryfast -tune zerolatency -b:v 4M -maxrate 2M -bufsize 1M -pix_fmt yuv420p -f flv "${TWITCH_RTMP_INGEST}${TWITCH_KEY}" -loglevel verbose -xerror