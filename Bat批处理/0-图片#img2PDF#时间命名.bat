@echo off & title 图片转为 PDF (时间命名) By Sengoku v2.0
REM 需要 python img2pdf jsort.bat

REM 开启延时变量
setlocal enabledelayedexpansion

REM 定位到目录
cd "%~dp1"

REM 获取时间
set hour=%time:~,2%
if "%time:~,1%"==" " set hour=0%time:~1,1%
REM echo %date:~0,4%%date:~5,2%%date:~8,2%%hour%%time:~3,2%%time:~6,2%
set imageTime=%date:~0,4%-%date:~5,2%-%date:~8,2%-%hour%%time:~3,2%%time:~6,2%

REM 设置路径
set image_path=
REM 开始循环
for /f "delims=" %%i in ('dir /b /a-d %*^|findstr /r /i "png$ jpg$"^|jsort /n /i') do (
    set image_path=!image_path!"%%~nxi" 
)
echo 文件清单: %image_path%

REM 开始转换
echo.
echo 正在将图片转换为 PDF
echo.
img2pdf %image_path% -o "%~dp1PDF-%imageTime%.pdf"