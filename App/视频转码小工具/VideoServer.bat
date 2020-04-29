@echo off &title 视频转码工具箱 By Sengoku v1.1
REM CODER BY Sengoku 2020-04-29
REM 优化代码,添加自定义参数设置

CD /D %~DP0
SET PATH="%~dp0";"%~dp0bin";%PATH%
MD output
if exist "%~dp0\bin\ffmpeg.exe" (
    echo 初始化主程序
  ) else (
    echo 找不到主程序,请重新安装！本窗口五秒后自动关闭！
    ping /n 5 127.0.0.1 >nul
    Exit
)
if "%~1" == "" (
    echo 无法获取拖入文件路径，请重试！本窗口五秒后自动关闭！
    ping /n 5 127.0.0.1 >nul
    Exit
  ) else (
    echo 成功获取拖入文件路径！
    echo %*
)
:chosequality
echo -------------------------------------
echo 视频转码工具箱
echo.
echo.
echo 选择转码参数
echo.&echo 	1. 原始分辨率 (高等质量)
echo.&echo 	2. 1080P (高等质量)
echo.&echo 	3. 720P (中等质量)
echo.&echo 	4. 480P (极限压缩)
echo.&echo 	5. 自定义 (码率和分辨率)
echo.&echo 	6. GIF动画 (256色)
echo.&echo 	7. 提取视频音频 (AAC格式)
echo.
Set /p chosequality=请选择上方列表对应序号：
REM set quality=%chosequality%
if "%chosequality%"=="1" (
    set quality=23.5
    set resize=iw
)
if "%chosequality%"=="2" (
    set quality=23.5
    set resize=1080
)
if "%chosequality%"=="3" (
    set quality=25.5
    set resize=720
)
if "%chosequality%"=="4" (
    set quality=30
    set resize=480
)
if "%chosequality%"=="5" (
    set quality=28
    set resize=720
)
if "%chosequality%"=="6" set quality=6
if "%chosequality%"=="7" set quality=7
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

if "%chosequality%" LEQ "4" (
    for %%a in (%*) do (
    ffmpeg.exe -i "%%~fa" -c:v libx264 -preset 8 -x264opts crf=%quality%:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -r 25 -vf "scale='-2':'min(%resize%,ih)':flags=lanczos" -pix_fmt yuv420p -c:a aac -b:a 128k -ar 44100 -y ".\output\%%~na_x264.mp4"
  )
  goto :end
)
if "%chosequality%" == "5" (
    call :setting
    for %%a in (%*) do (
    ffmpeg.exe -i "%%~fa" -c:v libx264 -preset 8 -x264opts crf=%quality%:keyint=infinite:min-keyint=1:scenecut=60:partitions=all:direct=auto:me=umh:merange=32:subme=10:trellis=2:rc-lookahead=60:ref=6:bframes=6:b-adapt=2:deblock=1,1:qcomp=0.5:psy-rd=0.3,0:aq-mode=2:aq-strength=0.8 -r 25 -vf "scale='-2':'min(%resize%,ih)':flags=lanczos" -pix_fmt yuv420p -c:a aac -b:a 128k -ar 44100 -y ".\output\%%~na_x264_CRF%quality%_%resize%p.mp4"
  )
)
if "%chosequality%" == "6" (
    for %%a in (%*) do ffmpeg.exe -i "%%~fa" -vf "fps=25,scale=-2:360:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 -y ".\output\%%~na.gif"
)
if "%chosequality%" == "7" (
    for %%a in (%*) do ffmpeg.exe -i "%%~fa" -c:a copy -y ".\output\%%~na.aac"
)

:end
cls
echo.
msg %username% /time:3 转码完成也可能转码失败，请返回窗口查看。文件保存在目录下的 output 文件夹中。 BY Sengoku
ECHO. &ECHO 转码完成也可能转码失败。本窗口将在五秒后自动关闭。
REM &PAUSE >NUL 2>NUL
ping /n 3 127.0.0.1 >nul
Exit
REM goto chosequality

:setting
cls
echo.
echo 输入码率参数
echo 请输入0-51的数字(数字越大质量越差)
echo 主观上合理的范围是:17-28，默认值:28
echo.
set /p quality=输入码率或直接回车：
cls
echo.
echo 输入视频高度，宽度自适应，默认值720
echo.
set /p resize=输入高度或直接回车：
GOTO :EOF