@echo off &title 序列帧转换视频 By Sengoku v1.0
REM CODER BY Sengoku 2020-04-24

CD /D %~DP0
SET PATH="%UserProfile%\bin";"%~dp0bin";%PATH%
MD output
:start
cls
echo.&echo.
echo -------------------------------------
echo 视频转码工具箱
echo.
echo.
Set FliePATH=%1
Set FlieName=%~nx1
echo 拖入的文件夹路径：%FliePATH%
Set /p FliePATH=直接执行或则拖入文件夹并回车：
cls
echo.&echo.
:check
echo -------------------------------------
echo 检测文件夹路径
echo.
if exist %FliePATH%\ (
    echo 检测完毕准备转换...
    goto convert
  ) else (
    echo 非法路径！请重试&PAUSE >NUL 2>NUL
    goto start
)
:convert
echo.
echo.
echo 	转码开始...
echo.
echo.
echo 	转码中，可【右键】最小化按钮可最小化到任务栏托盘
echo.
echo.
REM CD /D "%FliePATH%"\
REM echo "%cd%"
for %%a in (%FliePATH%\*.png;%FliePATH%\*.jpg) do (
    echo file '%%a' >> "%FliePATH%\images.txt"
)
ffmpeg -r 25 -f concat -safe 0 -i "%FliePATH%\images.txt" -c:v libx264 -preset 8 -x264opts crf=23.5:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" -pix_fmt yuv420p -an -y ".\output\%FlieName%.mp4"
del /q "%FliePATH%\images.txt"
cls
echo.
msg %username% /time:5 转码完成也可能转码失败，请返回窗口查看。文件保存在目录下的 output 文件夹中。 BY Sengoku
ECHO. &ECHO 转码完成也可能转码失败。本窗口将在五秒后自动关闭。
REM &PAUSE >NUL 2>NUL
ping /n 5 127.0.0.1 >nul
Exit