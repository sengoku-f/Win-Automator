Get-ChildItem -Recurse -Force -Filter "* *" | Rename-Item -NewName { $_.Name -replace " ","" }
Get-ChildItem -Recurse -Force -Filter "*每*" | Rename-Item -NewName { $_.Name -replace "每","-" }
Get-ChildItem -Recurse -Force -Filter "*ㄩ*" | Rename-Item -NewName { $_.Name -replace "ㄩ","-" }

# 在 cmd 中使用

powershell -command "Get-ChildItem -Recurse -Force -Filter '* *' | Rename-Item -NewName { $_.Name -replace ' ','' }"
powershell -command "Get-ChildItem -Recurse -Force -Filter '*每*' | Rename-Item -NewName { $_.Name -replace '每','-' }"
powershell -command "Get-ChildItem -Recurse -Force -Filter '*ㄩ*' | Rename-Item -NewName { $_.Name -replace 'ㄩ','-' }"