@echo off
setlocal

set VHD_PATH=C:\Users\Test\Documents\VirtualDisks.vhdx
set SCRIPT=%TEMP%\mount_vhd.txt

(
  echo select vdisk file="%VHD_PATH%"
  echo attach vdisk
) > "%SCRIPT%"

diskpart /s "%SCRIPT%"

del /f /q "%SCRIPT%"

endlocal
exit
