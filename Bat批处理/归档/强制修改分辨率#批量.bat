@echo off & title 图片批量强制修改分辨率 By Sengoku v1.0
cd "%~dp1"
for %%a in (*.png) do magick "%%~fa" -resize 2180x1051! "%%~na.png"