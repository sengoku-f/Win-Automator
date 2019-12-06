for /r %%a in (*.png) do (
    echo file '%%a' >> images.txt
)
ffmpeg.exe -r 25 -f concat -safe 0 -i images.txt -c:v libx264 -pix_fmt yuv420p -vf "scale=ceil(iw/2)*2:ceil(ih/2)*2" -y output_rgb.mp4
ffmpeg.exe -r 25 -f concat -safe 0 -i "images.txt" -vf "[in] scale=ceil(iw/2)*2:ceil(ih/2)*2, format=rgba, split [T1], fifo, lutrgb=r=maxval:g=maxval:b=maxval,[T2] overlay [out]; [T1] fifo, lutrgb=r=minval:g=minval:b=minval [T2]" -y output_alpha.mp4
del /q images.txt
ffmpeg -i output_rgb.mp4 -i output_alpha.mp4 -filter_complex hstack=inputs=2 -y out.mp4
for /f "delims=" %%i in ("%cd%") do set folder=%%~ni
echo %folder%
if exist "%folder%.mp4" del /q "%folder%.mp4"
ren out.mp4 "%folder%.mp4"
del /q output_rgb.mp4 output_alpha.mp4
