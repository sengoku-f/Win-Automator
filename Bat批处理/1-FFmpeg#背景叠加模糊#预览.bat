for %%a in (%*) do ffplay -i "%%~fa" -vf "split[a][b];[a]scale=iw*1.5:ih*1.5,boxblur=10:5[1];[b]scale=iw:ih[2];[1][2]overlay=x=(W-w)/2:y=(H-h)/2"
