@echo off & title 图片转为 PDF (时间命名) By Sengoku v1.0
set hour=%time:~,2%
if "%time:~,1%"==" " set hour=0%time:~1,1%

echo %date:~0,4%%date:~5,2%%date:~8,2%%hour%%time:~3,2%%time:~6,2%
set imageTime=%date:~0,4%-%date:~5,2%-%date:~8,2%-%hour%%time:~3,2%%time:~6,2%

cd "%~dp1"
magick "*.{png,jpeg,jpg}" -compress JPEG -quality 80 "PDF-%imageTime%.pdf"