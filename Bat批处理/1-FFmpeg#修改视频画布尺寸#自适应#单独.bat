::修改画布尺寸(单独) v1.3
REM 添加手动输入画布尺寸
cd "%~dp1"
set videoSIZENAME=1920x1080
set /p videoSIZENAME=输入视频画布尺寸,默认1920x1080画布尺寸:
set videoSIZE=%videoSIZENAME:x=:%
ffmpeg -i "%~nx1" -c:v libx264 -crf 23 -vf "scale=%videoSIZE%:flags=lanczos:force_original_aspect_ratio=decrease,setsar=1,pad=%videoSIZE%:(ow-iw)/2:(oh-ih)/2" -c:a copy -y "%~n1_%videoSIZENAME%.mp4"
