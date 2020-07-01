@echo off & title FFmpeg 视频裁剪 (单独) By Sengoku v1.3
REM 添加手动输入分辨率
cd "%~dp1"
set videoSIZENAME=1920x1080
set /p videoSIZENAME=输入视频尺寸,默认1920x1080分辨率:
set videoSIZE=%videoSIZENAME:x=:%
ffmpeg -i "%~nx1" -c:v libx264 -crf 18 -vf "crop=%videoSIZE%" -c:a copy -y "%~n1_%videoSIZENAME%.mp4"
