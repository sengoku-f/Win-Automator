@echo off & title 获取文件属性 2 By Sengoku v1.1
for %%i in (%*) do (
  echo.
  echo 完整的文件名    %%i
  echo 完全合格的路径名    %%~i
  echo 文件的绝对路径信息    %%~fi
  echo 文件所在的盘符    %%~di
  echo 文件的路径，不包含盘符    %%~pi
	echo 文件的路径，不包含扩展名    %%~dpni
  echo 文件的文件名，不包含扩展名    %%~ni
  echo 文件的扩展名    %%~xi
  echo 文件的上次修改时间    %%~ti
  echo 文件的大小    %%~zi
  echo.
)
pause