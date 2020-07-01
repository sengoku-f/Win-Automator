@echo off & title FFmpeg 批量修改分辨率 By Sengoku v1.0
cd "%~dp1"
REM mkdir 改变分辨率
for %%a in (*.mp4;*.mov;*.flv;*.mkv;*.avi) do ffmpeg -i "%%~fa" -c:v libx264 -crf 23 -vf scale=iw/4:-2:flags=lanczos,setsar=1 -c:a copy -y "%%~na_修改分辨率.mp4"

