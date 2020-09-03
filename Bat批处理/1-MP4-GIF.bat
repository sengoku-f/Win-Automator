@echo off & title MP4 ¡ú GIF By Sengoku v1.0
cd "%~dp1"
for %%a in (*.mp4) do magick -delay 4 -loop 0 "%%~fa" -layers OptimizePlus -layers OptimizeTransparency "%%~na.gif" & gifsicle -O3 --lossy=80 --colors 256 "%%~na.gif" -o "%%~na_o.gif"
