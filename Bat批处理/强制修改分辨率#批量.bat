cd "%~dp1"
for %%a in (*.png) do magick "%%~fa" -resize 2180x1051! "%%~na.png"

