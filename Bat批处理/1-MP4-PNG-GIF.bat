@echo off & title MP4 ¡ú PNG ¡ú GIF By Sengoku v1.0
cd "%~dp1"
mkdir temp
for %%a in (*.mp4) do ffmpeg -i "%%~fa" "temp\%%~na_%%06d.png"
magick -fuzz 1.6% -delay 4 -loop 0 "temp\*.png" -layers OptimizePlus -layers OptimizeTransparency "output.gif"
gifsicle -O3 --lossy=80 --colors 256 "output.gif" -o "output_o.gif"
rd /s /q temp
