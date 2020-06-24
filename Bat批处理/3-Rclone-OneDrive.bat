@echo off &title Rclone 同步 SendTo → onedrive By Sengoku v1.1
REM 设置代理
set http_proxy=socks5://127.0.0.1:1080
set https_proxy=socks5://127.0.0.1:1080
set http_proxy=http://127.0.0.1:1081
set https_proxy=http://127.0.0.1:1081
REM 开始同步 SendTo
rclone sync "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\SendTo" onedrive:"自动化\Windows 脚本\SendTo" -P --log-file="C:\Users\Administrator\Rclone_win.log" --include *.{bat}

REM 复制 results
rclone copy onedrive:"Windows 软件\stairspeedtest_reborn_win64\results" onedrive:"科学上网\测速图" -P --log-file="C:\Users\Administrator\Rclone_win.log" --include *.{png,jpg}

msg %username% /time:2 Rclone 同步完成也可能同步失败。日志保存在用户目录下。 BY Sengoku