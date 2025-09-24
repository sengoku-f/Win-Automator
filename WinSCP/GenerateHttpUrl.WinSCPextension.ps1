# @name         生成文件URL2
# @command      powershell.exe -ExecutionPolicy Bypass -STA -NoProfile ^
#                   -File "%EXTENSION_PATH%" -webRoot "%WebRoot%" -rootPath "%RootPath%" ^
#                   -hostName "%HostName%" -serverName "!@" -path "!/" %Https% %Pause% ^
#                   %Clipboard% %Open% %VirtualHost% !&
# @description  生成所选文件的HTTP URL
# @flag         RemoteFiles
# @flag         ShowResultsInMsgBox
# @version      5
# @homepage     https://winscp.net/eng/docs/extension_generate_http_url
# @require      WinSCP 5.12
# @option       - -site group "URL"
# @option         - -site label "这些是针对特定站点的选项。"
# @option         WebRoot -site textbox "&Web根路径:"
# @option         Https -site checkbox "使用HTTPS" "" "-https"
# @option         RootPath -site textbox "&URL根路径 (可选):"
# @option         HostName -site textbox "&覆盖Web服务器主机名 (可选):"
# @option         VirtualHost -site checkbox "使用虚拟主机风格" "" "-VirtualHost"
# @option       - group "选项"
# @option         Pause checkbox "显示URL" "-pause" "-pause"
# @option         Clipboard checkbox "将URL复制到剪贴板" "-clipboard" "-clipboard"
# @option         Open checkbox "在Web浏览器中打开URL" "" "-open"
# @optionspage  https://winscp.net/eng/docs/extension_generate_http_url#options

param (
    [Parameter(Mandatory = $True)]
    $webRoot,
    $rootPath,
    $hostName,
    $serverName,
    [Parameter(Mandatory = $True)]
    $path,
    [Switch]
    $https,
    [Switch]
    $pause,
    [Switch]
    $clipboard,
    [Switch]
    $open,
    [Switch] 
    $VirtualHost,
    [Parameter(Mandatory = $True, ValueFromRemainingArguments = $True, Position = 0)]
    $paths
)

try
{
    if (!$webRoot -or ($webRoot.SubString($webRoot.Length - 1, 1) -ne "/"))
    {
        $webRoot += "/"
    }

    $result = $Null
    foreach ($filePath in $paths)
    {
        $filePath = "$path$filePath"

        if (($filePath.Length -lt $webRoot.length) -or
            ($filePath.SubString(0, $webRoot.Length) -ne $webRoot))
        {
            throw "**The path $filePath is not under web root $webRoot.**"
        }
        
        if ($rootPath)
        {
            if ($rootPath.SubString($rootPath.Length - 1) -ne "/")
            {
                $rootPath += "/"
            }
        }
        else
        {
            $rootPath = "/"
        }

        $urlPath = $filePath.SubString($webRoot.Length)
        $urlPath = ($urlPath -split "/" | %{ [System.Uri]::EscapeDataString($_) }) -join "/"
     
        if ($https)
        { 
            $protocol = "https://"
        }
        else
        {
            $protocol = "http://"
        }

        # 每次文件都用一个新的临时 host
        $currentHost = if ($hostName) { $hostName } else { $serverName }
        
        # ===== 支持虚拟主机风格 URL =====
        if ($VirtualHost -and $urlPath -match "/") {
            $parts = $urlPath -split '/'
            $bucket = $parts[0]
            $objectPath = ($parts[1..($parts.Count-1)] -join "/")
            $currentHost = "$bucket.$currentHost"
            $urlPath = $objectPath
        }

        $url = "$protocol$currentHost$rootPath$urlPath"
        $result += $url
        if ($paths.Count -gt 1)
        {
            $result += "`r`n"
        }

        if ($open)
        {
            Start-Process $url
        }
    }

    if ($pause)
    {
        Write-Host -NoNewline $result
    }

    if ($clipboard)
    {
        Add-Type -Assembly PresentationCore
        [Windows.Clipboard]::SetText($result) 
    }

    $result = 0
}
catch
{
    Write-Host "Error: $($_.Exception.Message)"
    $result = 1
}

exit $result
