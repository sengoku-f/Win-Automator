@echo off
setlocal enabledelayedexpansion
set str=
for %%i in (%*) do (set str=!str! %%i)
echo !str!
ufind !str! | rush "magick {} -resize 50%% {%.}_50.jpg"