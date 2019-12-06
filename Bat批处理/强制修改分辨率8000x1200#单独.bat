cd "%~dp1"
mkdir back
xcopy "%~nx1" "back"
magick "%~nx1" -resize 8000x1200! "%~nx1"

