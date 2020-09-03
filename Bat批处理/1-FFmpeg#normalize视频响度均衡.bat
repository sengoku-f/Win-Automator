@echo off & title FFmpeg ÊÓÆµÏì¶È¾ùºâ (ffmpeg-normalize) By Sengoku v1.0
for %%f in (*.mp4) do ffmpeg-normalize "%%~f" -pr -c:a aac -b:a 192k -o "%%~nf_normalize.mp4"
pause