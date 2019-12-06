:: 序列帧-MOV v1.3
:: Quicktime Animation
:: -------------------------------------------------
:: 定位到父目录
cd "%~dp1"
:: 生成清单
ufind "%~1" -regex ".*\.png\|.*\.jpg" -maxdepth 1 -mindepth 1 > "%~1\images.txt" && sed -i "/./{s/^/file '&/;s/$/&'/}" "%~1\images.txt"
:: 执行转换
ffmpeg -r 25 -f concat -safe 0 -i "%~1\images.txt" -c:v png -compression_level 100 -pred mixed -an -y "%~1_png.mov"
::ffmpeg -r 25 -f concat -safe 0 -i "%~1\images.txt" -c:v qtrle -y "%~1_qtrle.mov"
:: 删除清单
del /q "%~1\images.txt"