@echo off & title FFmpeg 视频响度均衡 (ffmpeg-normalize) By Sengoku v1.0
for %%f in (*.mp4) do ffmpeg-normalize "%%~f" -pr -c:a aac -b:a 192k -o "%%~nf_normalize.mp4"
pause