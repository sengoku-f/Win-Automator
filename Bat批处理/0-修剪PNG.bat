@echo off & title 修剪 PNG 透明区域 By Sengoku v1.1
REM 修改匹配符(*.png)为(%*),匹配所选多个文件
cd "%~dp1"
mkdir back
for %%a in (%*) do xcopy "%%~fa" "back" & magick "%%~fa" -trim "%%~na.png"