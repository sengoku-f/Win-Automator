:: FFmpeg批量转码x264 720P v1.1.2
:: 删除level=4.1
:: 添加-pix_fmt yuv420p 色彩格式兼容
:: 修改匹配符(*.mp4;*.mov;*.flv;*.mkv;*.avi)为(%*),匹配所选多个文件
for %%a in (%*) do ffmpeg -i "%%~fa" -c:v libx264 -preset 8 -x264opts crf=23.5:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -r 25 -vf "scale='-2':'min(720,ih)':flags=lanczos" -pix_fmt yuv420p -c:a aac -b:a 128k -ar 44100 -y "%%~na_x264_720p.mp4"
