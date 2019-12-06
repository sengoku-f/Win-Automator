mkdir mov
for %%a in (*.mp4) do ffmpeg -i "%%~fa" -codec copy "mov\%%~na.mov"

