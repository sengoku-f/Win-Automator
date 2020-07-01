@echo off & title FFmpeg 视频修改分辨率 (单独) By Sengoku v1.2
cd "%~dp1"
REM mkdir 改变分辨率
set videoSIZE=5760:2460
set videoSIZENAME=%videoSIZEREM=x%
REM echo %VAT%
ffmpeg -i "%~nx1" -c:v libx264 -crf 23 -vf scale=%videoSIZE%:flags=lanczos,setsar=1 -c:a copy -y "%~n1_%videoSIZENAME%.mp4"
