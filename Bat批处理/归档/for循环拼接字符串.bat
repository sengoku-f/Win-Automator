@echo off & title for循环拼接字符串

REM 开启延时变量
setlocal enabledelayedexpansion

set var=
REM 开始循环
for %%i in (path\*.png) do (
    echo "%%i"
    set var=!var! "%%i"
)

echo 拼接结果:"%var%"
pause