@echo off & title FFmpeg 批量转码 x264 (720P) By Sengoku v1.1.2
REM 删除level=4.1
REM 添加-pix_fmt yuv420p 色彩格式兼容
REM 修改匹配符(*.mp4;*.mov;*.flv;*.mkv;*.avi)为(%*),匹配所选多个文件
REM 设置临时变量
SET PATH="%UserProfile%\bin";%PATH%
for %%a in (%*) do ffmpeg -i "%%~fa" -c:v libx264 -preset 8 -x264opts crf=23.5:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -r 25 -vf "scale='-2':'min(720,ih)':flags=lanczos" -pix_fmt yuv420p -c:a aac -b:a 128k -ar 44100 -y "%%~na_x264_720p.mp4"

cls
echo.
msg %username% /time:3 转码完成也可能转码失败，请返回窗口查看。文件保存在目录下的 output 文件夹中。 BY Sengoku