# Windows Terminal Configuration
Set-Location "C:\Users\Lycia Pintella\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe"
cmd /c rmdir /s /q "LocalState"
New-Item -ItemType Junction -Path "LocalState" -Target "C:\Users\Jessica Murphy\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"

Set-Location "C:\Users\Rose Pintella\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe"
cmd /c rmdir /s /q "LocalState"
New-Item -ItemType Junction -Path "LocalState" -Target "C:\Users\Jessica Murphy\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"

# Windows Libraries Configuration
Set-Location "C:\Users\Lycia Pintella\AppData\Roaming\Microsoft\Windows"
cmd /c rmdir /s /q "Libraries"
New-Item -ItemType Junction -Path "Libraries" -Target "C:\Users\Jessica Murphy\AppData\Roaming\Microsoft\Windows\Libraries"

Set-Location "C:\Users\Rose Pintella\AppData\Roaming\Microsoft\Windows"
cmd /c rmdir /s /q "Libraries"
New-Item -ItemType Junction -Path "Libraries" -Target "C:\Users\Jessica Murphy\AppData\Roaming\Microsoft\Windows\Libraries"

<# # Start Menu Configuration
Set-Location "C:\Users\Lycia Pintella\AppData\Local\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy"
cmd /c rmdir /s /q "LocalState"
New-Item -ItemType Junction -Path "LocalState" -Target "C:\Users\Jessica Murphy\AppData\Local\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState"

Set-Location "C:\Users\Rose Pintella\AppData\Local\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy"
cmd /c rmdir /s /q "LocalState"
New-Item -ItemType Junction -Path "LocalState" -Target "C:\Users\Jessica Murphy\AppData\Local\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState"
#>

Set-Location "C:\Users\Lycia Pintella\AppData\Roaming"
cmd /c rmdir /s /q "Teracopy"
New-Item -ItemType Junction -Path "Teracopy" -Target "C:\Users\Jessica Murphy\AppData\Roaming\TeraCopy"

Set-Location "C:\Users\Rose Pintella\AppData\Roaming"
cmd /c rmdir /s /q "Teracopy"
New-Item -ItemType Junction -Path "TeraCopy" -Target "C:\Users\Jessica Murphy\AppData\Roaming\TeraCopy"

Set-Location "C:\Users\Lycia Pintella\AppData\Roaming"
cmd /c rmdir /s /q "The Creative Assembly"
New-Item -ItemType Junction -Path "The Creative Assembly" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly"

Set-Location "C:\Users\Rose Pintella\AppData\Roaming"
cmd /c rmdir /s /q "The Creative Assembly"
New-Item -ItemType Junction -Path "The Creative Assembly" -Target "C:\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly"

Set-Location "C:\Users\Lycia Pintella\AppData\Roaming"
cmd /c rmdir /s /q "G HUB"
New-Item -ItemType Junction -Path "G HUB" -Target "C:\Users\Jessica Murphy\AppData\Roaming\G HUB"

Set-Location "C:\Users\Rose Pintella\AppData\Roaming"
cmd /c rmdir /s /q "G HUB"
New-Item -ItemType Junction -Path "G HUB" -Target "C:\Users\Jessica Murphy\AppData\Roaming\G HUB"

Set-Location "C:\Users\Lycia Pintella\AppData\Roaming"
cmd /c rmdir /s /q "FrodoWazEre"
New-Item -ItemType Junction -Path "FrodoWazEre" -Target "C:\Users\Jessica Murphy\AppData\Roaming\FrodoWazEre"

Set-Location "C:\Users\Rose Pintella\AppData\Roaming"
cmd /c rmdir /s /q "FrodoWazEre"
New-Item -ItemType Junction -Path "FrodoWazEre" -Target "C:\Users\Jessica Murphy\AppData\Roaming\FrodoWazEre"

Set-Location "C:\Users\Lycia Pintella\AppData\Roaming"
cmd /c rmdir /s /q "lghub"
New-Item -ItemType Junction -Path "lghub" -Target "C:\Users\Jessica Murphy\AppData\Roaming\lghub"

Set-Location "C:\Users\Rose Pintella\AppData\Roaming"
cmd /c rmdir /s /q "lghub"
New-Item -ItemType Junction -Path "lghub" -Target "C:\Users\Jessica Murphy\AppData\Roaming\lghub"

Set-Location "C:\Users\Lycia Pintella\AppData\Roaming"
cmd /c rmdir /s /q "IrfanView"
New-Item -ItemType Junction -Path "IrfanView" -Target "C:\Users\Jessica Murphy\AppData\Roaming\IrfanView"

Set-Location "C:\Users\Rose Pintella\AppData\Roaming"
cmd /c rmdir /s /q "IrfanView"
New-Item -ItemType Junction -Path "IrfanView" -Target "C:\Users\Jessica Murphy\AppData\Roaming\IrfanView"

Set-Location "C:\Users\Lycia Pintella\AppData\Roaming"
cmd /c rmdir /s /q "Code"
New-Item -ItemType Junction -Path "Code" -Target "C:\Users\Jessica Murphy\AppData\Roaming\Code"

Set-Location "C:\Users\Rose Pintella\AppData\Roaming"
cmd /c rmdir /s /q "Code"
New-Item -ItemType Junction -Path "Code" -Target "C:\Users\Jessica Murphy\AppData\Roaming\Code"

Set-Location "C:\Users\Lycia Pintella\AppData\Roaming"
cmd /c rmdir /s /q "discord"
New-Item -ItemType Junction -Path "discord" -Target "C:\Users\Jessica Murphy\AppData\Roaming\discord"

Set-Location "C:\Users\Rose Pintella\AppData\Roaming"
cmd /c rmdir /s /q "discord"
New-Item -ItemType Junction -Path "discord" -Target "C:\Users\Jessica Murphy\AppData\Roaming\discord"