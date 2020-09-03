@echo off & title 图片转为 PDF (文件夹命名) By Sengoku v1.0
cd "%~dp1"
magick "*.{png,jpeg,jpg}" -compress JPEG -quality 80 "outfile.pdf"
for /f "delims=" %%i in ("%cd%") do set folder=%%~ni
echo %folder%
if exist "%folder%.pdf" del /q "%folder%.pdf"
ren outfile.pdf "%folder%.pdf"