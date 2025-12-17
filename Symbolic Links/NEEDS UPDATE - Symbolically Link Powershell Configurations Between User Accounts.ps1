Set-Location "c:\Users\Lycia Pintella\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe"
cmd /c rmdir /s /q "LocalState"
New-Item -ItemType Junction -Path "LocalState" -Target "c:\Users\Jessica Murphy\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"

Set-Location "c:\Users\Rose Pintella\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe"
cmd /c rmdir /s /q "LocalState"
New-Item -ItemType Junction -Path "LocalState" -Target "c:\Users\Jessica Murphy\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"