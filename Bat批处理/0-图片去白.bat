@echo off & title 图片去除白色 By Sengoku v1.1
REM 修改匹配符(*.jpg)为(%*),匹配所选多个文件
cd "%~dp1"
for %%a in (%*) do magick "%%~fa" -fuzz 20%% -transparent white "%%~na_unmult.png"