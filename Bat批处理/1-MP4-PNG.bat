@echo off & title MP4 → PNG 序列帧 By Sengoku v1.0
cd "%~dp1"
for %%a in (*.mp4) do mkdir "%%~na_png" & ffmpeg -i "%%~fa" "%%~na_png\%%~na_%%06d.png"
