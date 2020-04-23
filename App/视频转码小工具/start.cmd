@echo off &title ffpeg转码测试
REM CODER BY Sengoku 2020-04-21

CD /D %~DP0 
REM color f1
SET PATH="%~dp0";"%~dp0bin";%PATH%
MD output
REM taskkill /IM ffmpeg.exe
REM start /min ffmpeg.exe
:start
cls
echo.&echo.
echo -------------------------------------
echo 视频转码工具箱
echo.
echo.
Set FliePATH=%1
echo 拖入的文件路径：%FliePATH%
Set /p FliePATH=直接执行或则拖入(视频文件^|文件夹)并回车：
cls
echo.&echo.
:chosequality
echo -------------------------------------
echo.
echo.
echo 常用代理列表
echo.&echo 	1. 原始分辨率 (高等质量)
echo.&echo 	2. 1080P (中等质量)
echo.&echo 	3. 720P (低等质量)
echo.&echo 	4. 480P (极限压缩)
echo.
Set /p chosequality=请选择上方列表对应序号：
set quality=%chosequality%
if "%chosequality%"=="1" set quality=crf=28:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -r 25 -vf "scale='-2':'min(1080,ih)':flags=lanczos" -pix_fmt yuv420p
if "%chosequality%"=="2" set quality=socks5://127.0.0.1:1080/
if "%chosequality%"=="3" set quality=http://127.0.0.1:10809/
if "%chosequality%"=="4" set quality=http://127.0.0.1:10809/
cls
echo.
echo.
:convert
echo 	转码开始...
cls
echo.
echo.
echo 	转码中，可【右键】最小化按钮可最小化到任务栏托盘
echo.
echo.
REM ffmpeg.exe -i %FliePATH% -c:v libx264 -preset 8 -x264opts %quality% -c:a aac -b:a 128k -ar 44100 -y ".\output\test.mp4"
if exist %FliePATH%\ (
    echo test 是文件夹
) else (
    echo test 是文件
)
pause
echo.
msg %username% /time:5 转码完成也可能转码失败，请返回窗口查看。文件保存在目录下的 output 文件夹中。 BY Sengoku
ECHO. &ECHO 下载完成也可能下载失败按任意键返回 &PAUSE >NUL 2>NUL
goto start