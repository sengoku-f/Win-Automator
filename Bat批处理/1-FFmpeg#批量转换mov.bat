@echo off & title FFmpeg 视频批量转为 MOV By Sengoku v1.0
for %%a in (*.mp4) do ffmpeg -i "%%~fa" -codec copy "%%~na.mov"