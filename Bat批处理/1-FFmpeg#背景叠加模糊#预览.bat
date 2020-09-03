@echo off & title FFmpeg ÊÓÆµ±³¾°µþ¼ÓÄ£ºý (Ô¤ÀÀ) By Sengoku v1.0
for %%a in (%*) do ffplay -i "%%~fa" -vf "split[a][b];[a]scale=iw*1.5:ih*1.5,boxblur=10:5[1];[b]scale=iw:ih[2];[1][2]overlay=x=(W-w)/2:y=(H-h)/2"
