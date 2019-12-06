@echo off
setlocal enabledelayedexpansion
set str=
for %%i in (%*) do (set str=!str! %%i)
::echo !str!
ufind !str!
pause