@echo off & title 图片强制修改分辨率到 8000x1200 By Sengoku v1.0
cd "%~dp1"
mkdir back
xcopy "%~nx1" "back"
magick "%~nx1" -resize 8000x1200! "%~nx1"

