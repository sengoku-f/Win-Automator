@echo off & title 7z 批量压缩 By Sengoku v1.0
for /d %%X in (*) do "c:\Program Files\7-Zip\7z.exe" a "%%X.7z" "%%X\"