@echo off & title 删除文件 By Sengoku v1.0
DEL /F /A /Q \\?\%1
RD /S /Q \\?\%1