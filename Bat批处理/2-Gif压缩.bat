cd "%~dp1"
set size=1200
set /p size=resize:
for %%a in (*.gif) do (
gifsicle --resize-fit-height %size% -O3 --lossy=80 --colors 256 "%%~fa" -o "%%~na_%size%_lossy80.gif"
)