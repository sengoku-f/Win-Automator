@echo off & title 序列帧 → MOV RLE By Sengoku v1.3
REM Quicktime Animation
REM -------------------------------------------------
REM 定位到父目录
cd "%~dp1"
REM 生成清单
ufind "%~1" -regex ".*\.png\|.*\.jpg" -maxdepth 1 -mindepth 1 > "%~1\images.txt" && sed -i "/./{s/^/file '&/;s/$/&'/}" "%~1\images.txt"
REM 执行转换
REM ffmpeg -r 25 -f concat -safe 0 -i "%~1\images.txt" -c:v png -compression_level 100 -pred mixed -y "%~1_png.mov"
ffmpeg -r 25 -f concat -safe 0 -i "%~1\images.txt" -c:v qtrle -an -y "%~1_qtrle.mov"
REM 删除清单
del /q "%~1\images.txt"