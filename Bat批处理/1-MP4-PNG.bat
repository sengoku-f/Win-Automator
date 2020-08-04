@echo off & title MP4 → PNG 序列帧 By Sengoku v1.1
REM 更新文件夹名称
REM 修改匹配符(*.mp4)为(%*),匹配所选文件
cd "%~dp1"
for %%a in (%*) do mkdir "%%~na" & ffmpeg -i "%%~fa" "%%~na\%%~na_%%06d.png"
