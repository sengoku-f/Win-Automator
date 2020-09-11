@echo off & title 序列帧 → GIF By Sengoku v1.2
REM 添加帧数计算
REM 添加循环
REM 使用图像读取修饰符[640x640]加速, -thumbnail 640x 也可以
REM -------------------------------------------------
REM 定位到父目录
cd "%~dp1"
REM 设置循环，0=无限循环
set loop=0
REM 设置帧数
set fps=25
set /a delay=100/%fps%
REM 开始循环
for /d %%i in (%*) do (
    cd "%%~i"
    REM 执行转换
    magick -fuzz 1.6%% -delay %delay% -loop %loop% "*.png"[640x] -treedepth 4 -layers OptimizePlus -layers OptimizeTransparency "out.gif"
    REM 压缩
    gifsicle -O3 --lossy=80 --colors 256 --resize-touch 640x_ "out.gif" -o "%%~i.gif"

    REM 删除
    del /q "out.gif"
)
REM 循环结束