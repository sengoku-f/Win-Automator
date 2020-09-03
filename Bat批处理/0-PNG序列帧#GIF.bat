@echo off & title ÐòÁÐÖ¡ ¡ú GIF By Sengoku v1.0
cd "%~dp1"
magick -fuzz 1.6% -delay 4 -loop 0 "*.png" -layers OptimizePlus -layers OptimizeTransparency "out.gif"
gifsicle -O3 --lossy=80 --colors 256 "out.gif" -o "out_o.gif"
for /f "delims=" %%i in ("%cd%") do set folder=%%~ni
echo %folder%
if exist "%folder%.gif" del /q "%folder%.gif"
ren out_o.gif "%folder%.gif"
del /q out.gif
