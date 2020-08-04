@echo off & title GIF 压缩 (720P) By Sengoku v1.1
REM 添加自定义操作
REM 修改匹配符(*.gif)为(%*),匹配所选多个文件
cd "%~dp1"
set size=720
set /p size=输入分辨率，默认720:
set colors=256
set /p colors=输入调色板，默认256:
set lossyGIF=80
set /p lossy=输入质量，默认80:

for %%a in (%*) do (
    gifsicle --resize-fit-height %size% -O3 --delay=8 --lossy=%lossyGIF% --colors %colors% "%%~fa" -o "%%~na_%size%_lossy%lossyGIF%.gif"
)