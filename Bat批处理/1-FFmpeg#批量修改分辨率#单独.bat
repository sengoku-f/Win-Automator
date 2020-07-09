@echo off & title FFmpeg 视频修改分辨率 (单独) By Sengoku v1.3
REM 添加手动输入分辨率
cd "%~dp1"
REM mkdir 改变分辨率
set /p videoSIZENAME=输入视频尺寸,如1920x1080:
set videoSIZE=%videoSIZENAME:x=:%
ffmpeg -i "%~nx1" -c:v libx264 -crf 23 -vf scale=%videoSIZE%:flags=lanczos,setsar=1 -c:a copy -y "%~n1_%videoSIZENAME%.mp4"
