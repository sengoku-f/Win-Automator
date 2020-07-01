@echo off & title FFmpeg 批量提取视频音频 By Sengoku v1.0
cd "%~dp1"
for %%a in (*.mp4;*.mov;*.flv;*.mkv;*.avi) do ffmpeg -i "%%~fa" -c:a copy -y "%%~na.aac"

