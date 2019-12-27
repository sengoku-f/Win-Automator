for %%a in (*.mp4) do ffmpeg -i "%%~fa" -c:v copy -filter:a "loudnorm" "%%~na_loudnorm.mp4"
pause