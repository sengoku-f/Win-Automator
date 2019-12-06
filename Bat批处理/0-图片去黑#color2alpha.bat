:: color2alpha去黑 v1.0
:: 修改为COLOR2ALPHA
:: 修改匹配符(*.jpg)为(%*),匹配所选多个文件
cd "%~dp1"
mkdir ".\COLOR2ALPHA"
for %%a in (%*) do (
	magick -quiet "%%~fa" -alpha off ".\COLOR2ALPHA\%%~na_tmp1.mpc"
	magick ".\COLOR2ALPHA\%%~na_tmp1.mpc" ^( -clone 0 -fill "black" -colorize 100 ^) -compose difference -composite -separate -evaluate-sequence max -auto-level -evaluate pow "1" ".\COLOR2ALPHA\%%~na_tmp2.mpc"
	magick -quiet ".\COLOR2ALPHA\%%~na_tmp1.mpc" ".\COLOR2ALPHA\%%~na_tmp2.mpc" -alpha off -compose copy_opacity -composite "%%~na_un.png"
)
rmdir /q /s ".\COLOR2ALPHA"