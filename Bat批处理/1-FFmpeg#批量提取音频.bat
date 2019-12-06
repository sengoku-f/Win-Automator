cd "%~dp1"
for %%a in (*.mp4;*.mov;*.flv;*.mkv;*.avi) do ffmpeg -i "%%~fa" -c:a copy -y "%%~na.aac"

