@echo off & title 图片批量修剪 3840x3840 (单独) By Sengoku v1.0
cd "%~dp1"
magick "%~nx1" -crop 3840x3840 "%~n1.jpg"

