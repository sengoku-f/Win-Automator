@echo off & title 序列帧 → MP4 (上下通道) By Sengoku v1.5.2
REM 需要依赖项 UnxUtils
REM 将 output_rgb.mp4 output_alpha.mp4 images.txt 文件放入子文件夹中,可以并行运行多个
REM 修复空格路径,"%%i"无法引用空格路径,可修改为%%i(不带双引号),%%~i(删除引号),%%~fi(扩展到一个完全合格的路径名)
REM 更新循环(*)为所选定文件夹(%*),帧速率修复
REM 修复奇偶像素
REM 更新为使用文件夹执行
REM -------------------------------------------------
REM 定位到父目录
cd "%~dp1"
REM 设置帧速率
set fps=25
REM 开始循环
for /d %%i in (%*) do ( 
    REM 生成清单
    ufind "%%~i" -regex ".*\.png\|.*\.jpg" -maxdepth 1 -mindepth 1 > "%%~i\images.txt" && sed -i "/./{s/^/file '&/;s/$/&'/}" "%%~i\images.txt"
    REM 转换rgb视频
    ffmpeg -r %fps% -f concat -safe 0 -i "%%~i\images.txt" -c:v libx264 -vf "scale=ceil(iw/2)*2:ceil(ih/2)*2" -r %fps% -pix_fmt yuv420p -an -y "%%~i\output_rgb.mp4"
    REM 转换alpha视频
    ffmpeg -r %fps% -f concat -safe 0 -i "%%~i\images.txt" -vf "[in] scale=ceil(iw/2)*2:ceil(ih/2)*2, format=rgba, split [T1], fifo, lutrgb=r=maxval:g=maxval:b=maxval,[T2] overlay [out]; [T1] fifo, lutrgb=r=minval:g=minval:b=minval [T2]" -an -y "%%~i\output_alpha.mp4"
    REM 合并视频
    ffmpeg -i "%%~i\output_rgb.mp4" -i "%%~i\output_alpha.mp4" -filter_complex vstack=inputs=2 -pix_fmt yuv420p -an -y "%%~i.mp4"
    REM 清理文件
    del /q "%%~i\output_rgb.mp4" "%%~i\output_alpha.mp4" "%%~i\images.txt"
)
REM 循环结束
REM 删除清单
rem del /q images.txt