for %%a in (*.mp3;*.wav) do ffmpeg -i "%%~fa" -filter:a "loudnorm" "%%~na_loudnorm.mp3"
pause