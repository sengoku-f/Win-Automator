:: 图片去白 v1.1
:: 修改匹配符(*.jpg)为(%*),匹配所选多个文件
cd "%~dp1"
for %%a in (%*) do magick "%%~fa" -fuzz 20%% -transparent white "%%~na_unmult.png"