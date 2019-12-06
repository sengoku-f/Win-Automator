:: 序列帧-MP4 v1.5.1
:: 修复空格路径,"%%i"无法引用空格路径,可修改为%%i(不带双引号),%%~i(删除引号),%%~fi(扩展到一个完全合格的路径名)
:: 更新循环(*)为所选定文件夹(%*),帧速率修复
:: 修复奇偶像素&半透明像素
:: 更新为使用文件夹执行
:: -------------------------------------------------
:: 定位到父目录
cd "%~dp1"
:: 设置帧速率
set fps=25
:: 开始循环
for /d %%i in (%*) do ( 
		:: 生成清单
		ufind "%%~i" -regex ".*\.png\|.*\.jpg" -maxdepth 1 -mindepth 1 > images.txt && sed -i "/./{s/^/file '&/;s/$/&'/}" images.txt
		:: 执行转换
		ffmpeg -r %fps% -f concat -safe 0 -i images.txt -c:v libx264 -preset 8 -x264opts crf=23.5:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -filter_complex "color=black,format=rgb24,fps=fps=%fps%[c];[c][0]scale2ref[c][i];[c][i]overlay=format=auto:shortest=1,setsar=1,pad=ceil(iw/2)*2:ceil(ih/2)*2" -r %fps% -pix_fmt yuv420p -an -y "%%~i.mp4"	
)
:: 循环结束
:: 删除清单
del /q images.txt