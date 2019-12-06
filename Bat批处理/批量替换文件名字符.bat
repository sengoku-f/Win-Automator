@echo off
setlocal enabledelayedexpansion
for %%a in (*¨C*) do (
  set file=%%a
  ren "!file!" "!file:¨C=-!"
)
