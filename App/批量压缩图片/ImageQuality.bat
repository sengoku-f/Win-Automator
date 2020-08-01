@echo off & title 批量压缩图片 By Sengoku v1.1
REM 添加 GIF 支持
REM CODER BY Sengoku 2020-07-31

CD /D %~DP0
SET PATH="%UserProfile%\bin";"%~dp0bin";%PATH%
MD output
if exist "%UserProfile%\bin\pngquant.exe" (
    echo 初始化 PNG 主程序%UserProfile%
  ) else (
      if exist "%~dp0\bin\pngquant.exe" (
        echo 初始化 PNG 主程序%~dp0
        ) else (
            echo 找不到 PNG 主程序,请重新安装！本窗口五秒后自动关闭！
            ping /n 5 127.0.0.1 >nul
            Exit
            )
)
if exist "%UserProfile%\bin\cjpeg.exe" (
    echo 初始化 JPG 主程序%UserProfile%
  ) else (
      if exist "%~dp0\bin\cjpeg.exe" (
        echo 初始化 JPG 主程序%~dp0
        ) else (
            echo 找不到 JPG 主程序,请重新安装！本窗口五秒后自动关闭！
            ping /n 5 127.0.0.1 >nul
            Exit
            )
)
if exist "%UserProfile%\bin\gifsicle.exe" (
    echo 初始化 GIF 主程序%UserProfile%
  ) else (
      if exist "%~dp0\bin\gifsicle.exe" (
        echo 初始化 GIF 主程序%~dp0
        ) else (
            echo 找不到 GIF 主程序,请重新安装！本窗口五秒后自动关闭！
            ping /n 5 127.0.0.1 >nul
            Exit
            )
)

:start
cls
echo.&echo.
echo -------------------------------------
echo 批量压缩图片
echo.
echo.
set FliePATH=%1
set FlieName=%~nx1
echo 拖入的文件夹路径：%FliePATH%
set /p FliePATH=直接执行或则拖入文件夹并回车：
cls
echo.&echo.

:check
echo -------------------------------------
echo 检测文件夹路径
echo.
if exist %FliePATH%\ (
    echo 检测完毕准备转换...
    goto chosequality
  ) else (
    echo 非法路径！请重试&PAUSE >NUL 2>NUL
    goto start
)

:chosequality
echo -------------------------------------
echo 批量压缩图片
echo.
echo.
echo 选择压缩参数
echo.&echo 	1.  256色 (高等质量)
echo.&echo 	2.  256色 (中等质量)
echo.&echo 	3.  128色 (中等质量)
echo.&echo 	4.  手动输入参数
echo.
set /p chosequality=请选择上方列表对应序号：
REM set quality=%chosequality%
if "%chosequality%"=="1" (
    set qualityPNG=70-85
    set color=256
    set qualityJPG=80
    set qualityGIF=80
)
if "%chosequality%"=="2" (
    set qualityPNG=45-65
    set color=256
    set qualityJPG=65
    set qualityGIF=65
)
if "%chosequality%"=="3" (
    set qualityPNG=45-65
    set color=128
    set qualityJPG=65
    set qualityGIF=65
)
if "%chosequality%"=="4" (
    set qualityPNG=70-85
    echo.&echo 输入 PNG 质量范围
    echo.&echo 介于0（最差）到100（完美）之间的数字
    echo.&echo 默认 70-85
    set /p qualityPNG=请输入质量范围：
    set color=256
    echo.&echo 输入调色板数值
    echo.&echo 介于 8 到 256 （包含颜色）之间的数字
    echo.&echo 默认 256
    set /p color=请输入色板范围：
    set qualityJPG=80
    set /p qualityJPG=请输入 JPG 质量范围：
    set qualityGIF=80
    set /p qualityGIF=请输入 GIF 质量范围：
)
cls
echo.
echo.

:convert
echo 	压缩开始...
cls
echo.
echo.
echo 	压缩中，可【右键】最小化按钮可最小化到任务栏托盘
echo.
echo.

if "%chosequality%" LEQ "5" (
  for %%a in (%FliePATH%\*.png) do (
    pngquant %color% --ext=.png --force --verbose --quality=%qualityPNG% --strip --speed 1 --skip-if-larger - < "%%~fa" > ".\output\%%~na.png"
  )
  for %%a in (%FliePATH%\*.jpg;%FliePATH%\*.jpeg) do (
    cjpeg -optimize -quality %qualityJPG% -outfile ".\output\%%~nxa" "%%~fa"
  )
  for %%a in (%FliePATH%\*.gif) do (
    gifsicle -O3 --lossy=%qualityGIF% --colors %color% "%%~fa" -o ".\output\%%~nxa"
  )
  goto :end
)

:end
cls
echo.
msg %username% /time:3 压缩完成也可能压缩失败，请返回窗口查看。文件保存在目录下的 output 文件夹中。 BY Sengoku
ECHO. &ECHO 压缩完成也可能压缩失败。本窗口将在五秒后自动关闭。
REM &PAUSE >NUL 2>NUL
ping /n 3 127.0.0.1 >nul
Exit