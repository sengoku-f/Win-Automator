@echo off &title Youtube-dl-油管队列下载
::CODER BY pcysanji 2020-03-02

CD /D %~DP0 
color f1
SET PATH="%~dp0";"%~dp0App";%PATH%
MD Download
taskkill /IM RBTray.exe
ping -n 1 127.0.0.1 > nul
start /min RBTray.exe
:start
cls
echo.&echo.
echo -------------------------------------
echo.
echo.
Set /p URL=请输入 youtube 队列视频链接并按回车：
cls
echo.&echo.
:choseproxy
echo -------------------------------------
echo.
echo.
echo 常用代理列表
echo.&echo 	1. http://127.0.0.1:7890/ (clash)
echo.&echo 	2. socks5://127.0.0.1:1080/ (Shadowsocks)
echo.&echo 	3. http://127.0.0.1:10809/ (V2RayN)
echo.&echo 	4. 不使用代理
echo.
Set /p choseproxy=请选择上方列表对应序号，若不存在请手动输入代理：
set proxy=%choseproxy%
if "%choseproxy%"=="1" set proxy=http://127.0.0.1:7890/
if "%choseproxy%"=="2" set proxy=socks5://127.0.0.1:1080/
if "%choseproxy%"=="3" set proxy=http://127.0.0.1:10809/
if "%choseproxy%"=="4" goto listdivider

:listdivider
echo "%URL%"|findstr "list" >nul
if %errorlevel% equ 0 (
	for /f "delims=& tokens=2" %%i in ("%URL%") do (
		set URL="https://www.youtube.com/playlist?%%i"
	)
	goto down
) else (
	goto down
)

cls
echo.
echo.
:down
echo 	下载开始...
ping -n 2 127.0.0.1 > nul
cls
echo.
echo.
echo 	下载中，可【右键】最小化按钮可最小化到任务栏托盘
echo.
echo.
youtube-dl.exe -i --cookies cookies.txt --proxy %proxy% --yes-playlist --socket-timeout 120 -R 12 -c  -o ".\Download\%%(upload_date)s-%%(title)s-%%(playlist_title)s-%%(resolution)s.%%(ext)s" %URL% --write-thumbnail --write-sub --write-auto-sub --sub-lang zh-Hans,zh-Hant,en
echo.
msg %username% /time:10 下载完成也可能下载失败，请返回窗口查看。 BY 320印象 320nle.com
ECHO. &ECHO 下载完成也可能下载失败按任意键返回 &PAUSE >NUL 2>NUL
goto start