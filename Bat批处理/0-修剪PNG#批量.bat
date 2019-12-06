cd "%~dp1"
mkdir back
for %%a in (*.png) do xcopy "%%~fa" "back" & magick "%%~fa" -trim "%%~na.png"

