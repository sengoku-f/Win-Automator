@echo off & title GIF 压缩 (720P) By Sengoku v1.0
REM 添加自定义操作
REM 修改匹配符(*.gif)为(%*),匹配所选多个文件
cd "%~dp1"
set size=1200
set /p size=resize:
for %%a in (%*) do (
    gifsicle --resize-fit-height %size% -O3 --lossy=80 --colors 256 "%%~fa" -o "%%~na_%size%_lossy80.gif"
)