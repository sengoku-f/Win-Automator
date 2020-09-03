@echo off & title 批量执行 Bat 脚本 By Sengoku v2
for /f "delims=" %%i in ('dir /a-d/s/b *.bat') do (
pushd "%%~dpi"
call "%%~i"
popd
)