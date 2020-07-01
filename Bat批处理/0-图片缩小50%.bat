@echo off & title 图片缩小 50% By Sengoku v1.0
setlocal enabledelayedexpansion
set str=
for %%i in (%*) do (set str=!str! %%i)
echo !str!
ufind !str! | rush "magick {} -resize 50%% {%.}_50.jpg"