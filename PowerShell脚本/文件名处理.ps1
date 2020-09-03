Get-ChildItem -Recurse -Force -Filter "* *" | Rename-Item -NewName { $_.Name -replace " ","" }
Get-ChildItem -Recurse -Force -Filter "*–*" | Rename-Item -NewName { $_.Name -replace "–","-" }
Get-ChildItem -Recurse -Force -Filter "*：*" | Rename-Item -NewName { $_.Name -replace "：","-" }

# 设定目录深度，和匹配文件

Get-ChildItem -Recurse -Force -Filter "* *" -Depth 0 -File -Include "*" | Rename-Item -NewName { $_.Name -replace " ","" }
Get-ChildItem -Recurse -Force -Filter "*–*" -Depth 0 -File -Include "*" | Rename-Item -NewName { $_.Name -replace "–","_" }
Get-ChildItem -Recurse -Force -Filter "*-*" -Depth 0 -File -Include "*" | Rename-Item -NewName { $_.Name -replace "-","_" }
Get-ChildItem -Recurse -Force -Filter "*：*" -Depth 0 -File -Include "*" | Rename-Item -NewName { $_.Name -replace "：","_" }
Get-ChildItem -Recurse -Force -Filter "*（*" -Depth 0 -File -Include "*" | Rename-Item -NewName { $_.Name -replace "（","(" }
Get-ChildItem -Recurse -Force -Filter "*）*" -Depth 0 -File -Include "*" | Rename-Item -NewName { $_.Name -replace "）",")" }

# cmd 中使用

powershell -command "Get-ChildItem -Recurse -Force -Filter '* *' | Rename-Item -NewName { $_.Name -replace ' ','' }"
powershell -command "Get-ChildItem -Recurse -Force -Filter '*–*' | Rename-Item -NewName { $_.Name -replace '–','-' }"
powershell -command "Get-ChildItem -Recurse -Force -Filter '*：*' | Rename-Item -NewName { $_.Name -replace '：','-' }"