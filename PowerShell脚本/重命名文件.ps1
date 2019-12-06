<#
Rename-Files.ps1
#>


# Find all wmv-files with a string "oldstring" and replace "oldstring" with "newstring" in the filename
Get-ChildItem *.wmv -Filter "*oldstring*" | ForEach { Rename-Item $_ -NewName $_.Name.Replace("oldstring","newstring") }


# Change the file extension of all .jpeg files to .jpg
# Credit: Ohad Schneider: "How can I bulk rename files in PowerShell?"
Get-ChildItem *.jpeg | Rename-Item -NewName { [System.IO.Path]::ChangeExtension($_.Name, ".jpg") }


# Rename all PDF-files in a folder to lowercase
Get-ChildItem *.pdf | Rename-Item -NewName { $_.Name.ToLower() }


# Replace the space character(s) with an underscore in all the filenames found in the current folder and the successive subfolders
Get-ChildItem -Recurse -Force -Filter "* *" | Rename-Item -NewName { $_.Name -replace " ","_" }


# Rename files with an increasing number
Get-ChildItem *.jpg | ForEach-Object -Begin { $count = 1 } -Process { Rename-Item $_ -NewName "image_$count.jpg"; $count++ }


# Rename files with an increasing number
Get-ChildItem *.jpg | ForEach-Object -Begin { $count = 1 } -Process { Rename-Item $_ -NewName "image_$count.jpg"; $count++ }


# Inserting a prefix into filenames

        $source_path = "C:\Temp"
        $filter = "*.pdf"
        $new_prefix = "ACertainNewPrefix"

        # Retrieve files with the $source_path and $filter parameters, for example all PDF-files from C:\Temp
        # $filter = "" parameter value would retrieve all available instances, i.e. no filtering 
        $files = Get-ChildItem -Path $source_path -Filter $filter

            # Process each file and add the $new_prefix to the filenames
            ForEach ($file in $files) {

                $old_file_name = $file.Name
                $new_full_name = "$($file.DirectoryName)" + "\" + "$($new_prefix)" + "$($old_file_name)"

                # Rename the file (perhaps first with the -WhatIf parameter?)
                # Rename-Item $file.FullName -NewName $new_full_name -WhatIf
                  Rename-Item $file.FullName -NewName $new_full_name

            } # ForEach $file

# Source: Don Jones: "Appending text to the beginning of a variable file name" https://powershell.org/forums/topic/appending-text-to-the-beginning-of-a-variable-file-name/




<#

Renaming Multiple Files in Windows Explorer (known as File Explorer in Windows 10)

        (1) Start by selecting a bunch of files: one can hold down for example...
                (a) the Ctrl key to select multiple files with multiple clicks or
                (b) the Shift key to select a range of files.
        (2) After the files are selected, use a rename command:
                (a) the button on the Home menu,
                (b) the command on the context menu or
                (c) the F2 key
            Result: All the files remain selected, but the first one in the group gets its name highlighted.
        (3) Type a new name for the (highlighted) file.
        (4) Hit Enter or click somewhere else in the window.
            Result: All the selected files are renamed using the name that was just typed in
                    and are appended with a number in parentheses to differentiate them.

# Source: http://www.howtogeek.com/111859/how-to-batch-rename-files-in-windows-4-ways-to-rename-multiple-files/

#>

# Source: help Rename-Item -Full
# Source: Jeffrey Snover: "Renaming Files": https://blogs.msdn.microsoft.com/powershell/2007/03/06/renaming-files/
# Source: John Savill: "Use Windows PowerShell to Rename Files": http://windowsitpro.com/powershell/use-windows-powershell-rename-files
# Source: Ed Wilson: "Use PowerShell to Rename Files in Bulk": https://blogs.technet.microsoft.com/heyscriptingguy/2013/11/22/use-powershell-to-rename-files-in-bulk/
# Source: Ohad Schneider: "How can I bulk rename files in PowerShell?": http://stackoverflow.com/questions/13382638/how-can-i-bulk-rename-files-in-powershell/36241702#36241702
# Source: http://tweaks.com/windows/49459/batch-file-rename-with-windows-powershell/
# Source: http://www.howtogeek.com/111859/how-to-batch-rename-files-in-windows-4-ways-to-rename-multiple-files/
