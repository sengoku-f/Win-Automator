cd "%~dp1"
mkdir 改变分辨率
for %%a in (*.mp4;*.mov;*.flv;*.mkv;*.avi) do ffmpeg -i "%%~fa" -c:v libx264 -crf 23 -vf scale=iw/4:-2:flags=lanczos,setsar=1 -c:a copy -y "改变分辨率\%%~na.mp4"

