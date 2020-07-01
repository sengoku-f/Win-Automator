chcp 65001
cd "%~dp1"
:: 开始循环
for /d %%i in (*) do ( 
    :: 生成清单
    ufind "%%i" -regex ".*\.png\|.*\.jpg" -maxdepth 1 -mindepth 1 > %%i.txt && sed -i "/./{s/^/file '&/;s/$/&'/}" %%i.txt
)
ufind "%cd%" -maxdepth 1 -type f -name "*.txt" | rush "ffmpeg -r 25 -f concat -safe 0 -i {} -c:v libx264 -y {}.mp4"
pause