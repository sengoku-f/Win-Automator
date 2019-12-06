cd "%~dp1"
for %%a in (*.jpg) do magick "%%~fa" -crop 3840x3840 "%%~na.jpg"
for %%a in (*.png) do magick "%%~fa" -crop 3840x3840 "%%~na.png"

