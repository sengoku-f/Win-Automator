@echo off & title Rclone 同步 SendTo → onedrive By Sengoku v1.2
REM 设置代理
set http_proxy=socks5://127.0.0.1:1080
set https_proxy=socks5://127.0.0.1:1080
set http_proxy=http://127.0.0.1:1080
set https_proxy=http://127.0.0.1:1080
REM 开始同步 SendTo
rclone sync "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\SendTo" onedrive:"自动化\Windows 脚本\SendTo" -P --log-file="C:\Users\Administrator\Rclone_win.log" --include *.{bat}

REM 开始同步 Win-Automator
rclone sync "D:\Git\Win-Automator" onedrive:"自动化\Windows 脚本" -P --log-file="C:\Users\Administrator\Rclone_win.log" --exclude ".git/" --exclude "SendTo/" --exclude "*.md"

REM 复制 results
rclone copy onedrive:"Windows 软件\stairspeedtest_reborn_win64\results" onedrive:"科学上网\测速图" -P --log-file="C:\Users\Administrator\Rclone_win.log" --include *.{png,jpg}

REM 同步 scoop
REM 先压缩一遍
cd "C:\Users\Administrator"
7z a scoop.zip scoop\
rclone copy "C:\Users\Administrator\scoop.zip" onedrive:"储藏库\bin" -P --log-file="C:\Users\Administrator\Rclone_win.log"

msg %username% /time:2 Rclone 同步完成也可能同步失败。日志保存在用户目录下。 BY Sengoku