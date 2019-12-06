:: 序列帧-MP4 v1.4.2
:: 帧速率修复
:: 修复奇偶像素&半透明像素
:: 更新"images.txt"路径不冲突
:: 更新为不遍历目录文件夹,单独处理文件夹
:: -------------------------------------------------
:: 定位到父目录
cd "%~dp1"
:: 生成清单
ufind "%~1" -regex ".*\.png\|.*\.jpg" -maxdepth 1 -mindepth 1 > "%~1\images.txt" && sed -i "/./{s/^/file '&/;s/$/&'/}" "%~1\images.txt"
:: 设置帧速率
set fps=25
:: 执行转换
ffmpeg -r %fps% -f concat -safe 0 -i "%~1\images.txt" -c:v libx264 -preset 8 -x264opts crf=23.5:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -filter_complex "color=black,format=rgb24,fps=fps=%fps%[c];[c][0]scale2ref[c][i];[c][i]overlay=format=auto:shortest=1,setsar=1,pad=ceil(iw/2)*2:ceil(ih/2)*2" -r %fps% -pix_fmt yuv420p -an -y "%~1.mp4"
:: 删除清单
del /q "%~1\images.txt"