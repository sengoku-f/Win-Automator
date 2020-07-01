@echo off & title FFmpeg 音频响度均衡 (ffmpeg-normalize) By Sengoku v1.0
for %%f in (*.mp3;*.wav) do ffmpeg-normalize "%%~f" -pr -c:a libmp3lame -b:a 320k -o "%%~nf_normalize.mp3"
pause