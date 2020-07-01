@echo off & title ????????? By Sengoku v1.0
setlocal enabledelayedexpansion
for %%a in (*¨C*) do (
  set file=%%a
  ren "!file!" "!file:¨C=-!"
)
