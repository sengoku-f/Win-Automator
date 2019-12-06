for /f "delims=" %%i in ('dir /a-d/s/b *.bat') do (
cd /d "%%~dpi"
call "%%~nxi"
)