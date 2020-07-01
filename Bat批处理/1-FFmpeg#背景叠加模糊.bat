@echo off & title FFmpeg 视频背景叠加模糊 By Sengoku v1.0
for %%a in (*.mp4;*.mov;*.flv;*.mkv;*.avi) do ffmpeg -i "%%~fa" -c:v libx264 -preset 8 -x264opts crf=23.5:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -r 25 -vf "split[a][b];[a]scale=iw*1.5:ih*1.5,boxblur=10:5[1];[b]scale=iw:ih[2];[1][2]overlay=x=(W-w)/2:y=(H-h)/2" -c:a aac -b:a 128k -ar 44100 -y "%%~na_Blur.mp4"

