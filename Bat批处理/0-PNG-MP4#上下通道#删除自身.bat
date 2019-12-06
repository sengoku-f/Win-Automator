for /r %%a in (*.png) do (
    echo file '%%a' >> images.txt
)
ffmpeg.exe -r 25 -f concat -safe 0 -i images.txt -c:v libx264 -pix_fmt yuv420p output_rgb.mp4
ffmpeg.exe -r 25 -f concat -safe 0 -i images.txt -vf "[in] format=rgba, split [T1], fifo, lutrgb=r=maxval:g=maxval:b=maxval,[T2] overlay [out]; [T1] fifo, lutrgb=r=minval:g=minval:b=minval [T2]" output_alpha.mp4
del /q images.txt
ffmpeg -i output_rgb.mp4 -i output_alpha.mp4 -filter_complex vstack=inputs=2 -y out.mp4
for /f "delims=" %%i in ("%cd%") do set folder=%%~ni
echo %folder%
if exist "%folder%.mp4" del /q "%folder%.mp4"
ren out.mp4 "%folder%.mp4"
del /q output_rgb.mp4 output_alpha.mp4
del %0