for /f "delims=" %%i in ('dir /a-d/s/b *.bat') do (
pushd "%%~dpi"
call "%%~i"
popd
)