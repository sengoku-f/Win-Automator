cd "%~dp1"
ufind "%cd%" -regex ".*\.png\|.*\.jpg" -maxdepth 1 -mindepth 1 > images.txt && sed -i "/./{s/^/file '&/;s/$/&'/}" images.txt
ffmpeg -r 25 -f concat -safe 0 -i images.txt -c:v libx264 -preset 8 -x264opts crf=23.5:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" -pix_fmt yuv420p -an -y "output.mp4"
for /f "delims=" %%i in ("%cd%") do set folder=%%~ni
echo %folder%
if exist "%folder%.mp4" del /q "%folder%.mp4"
ren output.mp4 "%folder%.mp4"
del /q images.txt