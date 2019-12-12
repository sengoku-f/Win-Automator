:: Gif压缩 720P v1.1
:: 添加自定义操作
:: 修改匹配符(*.gif)为(%*),匹配所选多个文件
cd "%~dp1"
set size=1200
set /p size=resize:
for %%a in (%*) do (
gifsicle --resize-fit-height %size% -O3 --lossy=80 --colors 256 "%%~fa" -o "%%~na_%size%_lossy80.gif"
)