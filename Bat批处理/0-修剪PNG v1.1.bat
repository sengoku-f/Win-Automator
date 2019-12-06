:: 修剪png v1.1
:: 修改匹配符(*.png)为(%*),匹配所选多个文件
cd "%~dp1"
mkdir back
for %%a in (%*) do xcopy "%%~fa" "back" & magick "%%~fa" -trim "%%~na.png"

