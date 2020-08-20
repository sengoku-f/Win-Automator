echo off & title IOS 切图分类 By Sengoku v1.2
REM -------------------------------------------------
REM 定位到父目录
cd /d "%~dp1"
if exist "%~1\" (
  echo.
  echo "%~1" 是文件夹
  echo.
  echo 定位到文件夹
  cd /d "%~1"
  echo.
  echo 开始分类文件
  echo.
  call :check_file
  call :move_3x
  call :move_2x
  call :move_1x
  ) else (
    echo.
    echo "%~1" 是文件
    echo.
    echo 定位到文件所在目录
    cd /d "%~dp1"
    echo.
    echo 开始分类文件
    echo.
    call :check_file
    call :move_3x
    call :move_2x
    call :move_1x
)

:end
REM cls
echo.
REM msg %username% /time:2 IOS 切图分类完成。 BY Sengoku
ECHO. &ECHO 切图分类完成。本窗口自动关闭。BY Sengoku
REM &PAUSE >NUL 2>NUL
REM ping /n 3 127.0.0.1 >nul
Exit

:check_file
REM 判断 @3x 文件是否存在
if exist "*@3x*.png" (
    REM 如果存在 @3x.png 则创建文件夹
    echo "创建 @3x 文件夹"
    md "@3x"
    echo.
    echo "开始移动 @3x"
    
    echo.
  ) else (
    REM 否则判断 @3x.jpg 是否存在
    if exist "*@3x*.jpg" (
        REM 如果存在 @3x.jpg 则创建文件夹
        echo "创建 @3x 文件夹"
        md "@3x"
        echo.
        echo "开始移动 @3x"
        
        echo.
      ) else (
        REM 不存在则返回
        echo.
        echo "不存在 @3x 的 PNG 和 JPG 文件"
      )
)

REM 判断 @2x 文件是否存在
if exist "*@2x*.png" (
    REM 如果存在 @2x.png 则创建文件夹
    echo "创建 @2x 文件夹"
    md "@2x"
    echo.
    echo "开始移动 @2x"
    
    echo.
  ) else (
    REM 否则判断 @2x.jpg 是否存在
    if exist "*@2x*.jpg" (
        REM 如果存在 @2x.jpg 则创建文件夹
        echo "创建 @2x 文件夹"
        md "@2x"
        echo.
        echo "开始移动 @2x"
        
        echo.
      ) else (
        REM 不存在则返回
        echo.
        echo "不存在 @2x 的 PNG 和 JPG 文件"
      )
)

REM 判断 @1x 文件是否存在
if exist "*.png" (
    REM 如果存在 @1x.png 则创建文件夹
    echo "创建 @1x 文件夹"
    md "@1x"
    echo.
    echo "开始移动 @1x"
    
    echo.
  ) else (
    REM 否则判断 @1x.jpg 是否存在
    if exist "*.jpg" (
        REM 如果存在 @1x.jpg 则创建文件夹
        echo "创建 @1x 文件夹"
        md "@1x"
        echo.
        echo "开始移动 @1x"
        
        echo.
      ) else (
        REM 不存在则返回
        echo.
        echo "不存在 @1x 的 PNG 和 JPG 文件"
      )
)
echo 结束判断
goto :EOF

:move_3x
REM 搜索目录下所有 @3x 的 PNG 和 JPG，使用 xargs 多线程移动到 @3x 文件夹
ufind "." -type f -iregex ".*@3x.*\(jpg\|jpeg\|png\)$" -maxdepth 1 -mindepth 1 -print0 | gxargs -0 -P 12 -I {} mv -f "{}" "@3x"
goto :EOF

:move_2x
REM 搜索目录下所有 @2x 的 PNG 和 JPG，使用 xargs 多线程移动到 @2x 文件夹
ufind "." -type f -iregex ".*@2x.*\(jpg\|jpeg\|png\)$" -maxdepth 1 -mindepth 1 -print0 | gxargs -0 -P 12 -I {} mv -f "{}" "@2x"
goto :EOF

:move_1x
REM 搜索目录下所有 @1x 的 PNG 和 JPG，使用 xargs 多线程移动到 @1x 文件夹
ufind "." -type f -iregex ".*\(jpg\|jpeg\|png\)$" -not -path "*@*x*" -maxdepth 1 -mindepth 1 -print0 | gxargs -0 -P 12 -I {} mv -f "{}" "@1x"
goto :EOF