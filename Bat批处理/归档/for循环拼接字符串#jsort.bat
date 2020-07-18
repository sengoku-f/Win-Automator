@echo off & title for循环拼接字符串 jsort 排序

REM 开启延时变量
setlocal enabledelayedexpansion

set var=
REM 开始循环
REM findstr /r /i "png$ jpg$" 过滤 png 和 jpg
for /f "delims=" %%i in ('dir /b /a-d %*^|findstr /r /i "png$ jpg$"^|jsort /n /i') do (
    echo "%%i"
    set var=!var!"%%i" 
)

echo 拼接结果:"%var%"
pause