@echo off & title 添加右键服务
>NUL 2>&1 REG.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)

CD /D %~DP0\..\
SET binPATH="%~dp0bin"
SET servePATH="%~dp0serve"
REM echo %APPDATA%\Microsoft\Windows\SendTo
REM echo "%~DP0"
REM echo %UserProfile%
REM pause
:menu
cls
echo.&echo.
echo -------------------------------------
echo.
echo.
echo 请选择
echo.
echo.  [1] 安装服务
echo.
echo.  [2] 删除服务
echo.
echo.  [X] 退出
echo.
choice /C:12X /N /M  "输入您的选项："

if errorlevel 3 exit
if errorlevel 2 goto :delete
if errorlevel 1 goto :startup

:startup
xcopy /e/f/y "%binPATH%" "%UserProfile%\bin\"
xcopy /e/f/y "%servePATH%" "%APPDATA%\Microsoft\Windows\SendTo"
echo 添加成功，按任意键退出 &pause >NUL
exit

:delete
echo 删除目录"%UserProfile%\bin"
rmdir /s/q "%UserProfile%\bin"
for %%i in (%servePATH%\*.bat) do ( del /f/s/q "%APPDATA%\Microsoft\Windows\SendTo\%%~nxi" )
echo 删除成功，按任意键退出&pause >NUL
exit