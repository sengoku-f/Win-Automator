::修改分辨率(单独) v1.2
 cd "%~dp1"
mkdir 改变分辨率
set videoSIZE=1600:900
set videoSIZENAME=%videoSIZE::=x%
::echo %VAT%
ffmpeg -i "%~nx1" -c:v libx264 -crf 23 -vf "scale=%videoSIZE%:flags=lanczos:force_original_aspect_ratio=increase,setsar=1,crop=%videoSIZE%" -c:a copy -y "改变分辨率\%~n1_%videoSIZENAME%.mp4"
