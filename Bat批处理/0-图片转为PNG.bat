@echo off & title 图片转为 PNG By Sengoku v1.0
cd "%~dp1"
magick "%~nx1" "%~n1.png"