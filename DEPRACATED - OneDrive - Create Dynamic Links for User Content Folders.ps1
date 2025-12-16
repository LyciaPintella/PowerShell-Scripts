
<#
Set-Location "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\AppData Settings and Start Menu Configuration Auto Backup\Jessica Ariadne Murphy"
# cmd /c rmdir /s /q "Total War Warhammer III - Settings and Save Games Auto Backup"
New-Item -ItemType Directory -Path "Total War Warhammer III - Settings and Save Games Auto Backup"

Set-Location "C:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\AppData Settings and Start Menu Configuration Auto Backup\Jessica Ariadne Murphy\Total War Warhammer III - Settings and Save Games Auto Backup"
cmd /c rmdir /s /q "advice_history"
cmd /c rmdir /s /q "auth"
cmd /c rmdir /s /q "battle_preferences"
cmd /c rmdir /s /q "custom_keys"
cmd /c rmdir /s /q "event_feed"
cmd /c rmdir /s /q "ingame_messaging"
cmd /c rmdir /s /q "maps"
cmd /c rmdir /s /q "replays"
cmd /c rmdir /s /q "resume"
cmd /c rmdir /s /q "saved_characters"
cmd /c rmdir /s /q "save_games"
cmd /c rmdir /s /q "screenshots"
cmd /c rmdir /s /q "scripts"

New-Item -ItemType Junction -Path "advice_history" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\advice_history"
New-Item -ItemType Junction -Path "auth" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\auth"
New-Item -ItemType Junction -Path "battle_preferences" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\battle_preferences"
New-Item -ItemType Junction -Path "custom_keys" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\custom_keys"
New-Item -ItemType Junction -Path "event_feed" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\event_feed"
New-Item -ItemType Junction -Path "ingame_messaging" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\ingame_messaging"
New-Item -ItemType Junction -Path "maps" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\maps"

New-Item -ItemType Junction -Path "resume" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\resume"
New-Item -ItemType Junction -Path "saved_characters" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\saved_characters"
New-Item -ItemType Junction -Path "save_games" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\save_games"
New-Item -ItemType Junction -Path "screenshots" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\Users\Jessica Murphy\AppData\Roaming\The Creative Assembly\Warhammer3\screenshots"

#Temp Files
New-Item -ItemType Junction -Path "crash_report"  -Target "G:\Scrap AppData\Warhammer3\crash_report"
New-Item -ItemType Junction -Path "logs" -Target "G:\Scrap AppData\Warhammer3\logs"
New-Item -ItemType Junction -Path "replays" -Target "G:\Scrap AppData\Warhammer3\replays"

#>
<# TOTAL WAR: WARHAMMER III - RUNCHER AND RPFM SETTINGS DYNAMIC LINK SECTION #>
<# ONEDRIVE APPDATA COPY OF RUNCHER AND RPFM CONFIG #>
<#
Set-Location "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\AppData Settings and Start Menu Configuration Auto Backup\Jessica Ariadne Murphy"
New-Item -ItemType Directory -Path "Total War Warhammer III - Runcher And RPFM Configuration Auto Backup"

Set-Location "C:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\AppData Settings and Start Menu Configuration Auto Backup\Jessica Ariadne Murphy\Total War Warhammer III - Runcher And RPFM Configuration Auto Backup"
cmd /c rmdir /s /q "Runcher Settings Backup"
New-Item -ItemType Junction -Path "Runcher Settings Backup" -Target "C:\Users\Jessica Murphy\AppData\Roaming\FrodoWazEre\runcher"
cmd /c rmdir /s /q "RPFM Settings Backup"
New-Item -ItemType Directory -Path "RPFM Settings Backup"

Set-Location "C:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\AppData Settings and Start Menu Configuration Auto Backup\Jessica Ariadne Murphy\Total War Warhammer III - Runcher And RPFM Configuration Auto Backup\RPFM Settings Backup"
New-Item -ItemType Directory -Path "config"

Set-Location "C:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\AppData Settings and Start Menu Configuration Auto Backup\Jessica Ariadne Murphy\Total War Warhammer III - Runcher And RPFM Configuration Auto Backup\RPFM Settings Backup\config"

#autosaves folder can become very large. Remove if needed.
New-Item -ItemType Junction -Path "autosaves" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\Users\Jessica Murphy\AppData\Roaming\FrodoWazEre\rpfm\config\autosaves"

New-Item -ItemType Junction -Path "dependencies" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\Users\Jessica Murphy\AppData\Roaming\FrodoWazEre\rpfm\config\dependencies"
New-Item -ItemType Junction -Path "error" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\Users\Jessica Murphy\AppData\Roaming\FrodoWazEre\rpfm\config\error"
New-Item -ItemType Junction -Path "old_ak_files" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\Users\Jessica Murphy\AppData\Roaming\FrodoWazEre\rpfm\config\old_ak_files"
New-Item -ItemType Junction -Path "schemas" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\Users\Jessica Murphy\AppData\Roaming\FrodoWazEre\rpfm\config\schemas"
New-Item -ItemType Junction -Path "table_patches" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\Users\Jessica Murphy\AppData\Roaming\FrodoWazEre\rpfm\config\table_patches"
New-Item -ItemType Junction -Path "table_profiles" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\Users\Jessica Murphy\AppData\Roaming\FrodoWazEre\rpfm\config\table_profiles"
New-Item -ItemType Junction -Path "translations_local" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\Users\Jessica Murphy\AppData\Roaming\FrodoWazEre\rpfm\config\translations_local"
New-Item -ItemType Junction -Path "tw_autogen" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\Users\Jessica Murphy\AppData\Roaming\FrodoWazEre\rpfm\config\tw_autogen"
#>

<# PART FOUR - WINDOWS START MENU CONFIGURATION DYNAMIC LINK SECTION #>
<#
Set-Location "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\AppData Settings and Start Menu Configuration Auto Backup\Jessica Ariadne Murphy"
# cmd /c rmdir /s /q "Local"
New-Item -ItemType Directory -Path "Local"
Set-Location "C:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\AppData Settings and Start Menu Configuration Auto Backup\Jessica Ariadne Murphy\Local"
New-Item -ItemType Directory -Path "Packages"
Set-Location "C:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\AppData Settings and Start Menu Configuration Auto Backup\Jessica Ariadne Murphy\Local\Packages"
New-Item -ItemType Directory -Path "Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy"
Set-Location "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\AppData Settings and Start Menu Configuration Auto Backup\Jessica Ariadne Murphy\Local\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy"
New-Item -ItemType Junction -Path "LocalState" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\Users\Jessica Murphy\AppData\Local\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState"
#>
<# Setup Links in secondary OneDrive folders to Primary Jessica Ariadne Murphy backup. #>
<#
Set-Location "D:\OneDrive\Lycia Pintella\OneDrive"
cmd /c rmdir /s /q "Documents"
cmd /c rmdir /s /q "Music"
cmd /c rmdir /s /q "Pictures"
cmd /c rmdir /s /q "Videos"

New-Item -ItemType Junction -Path "Documents" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\OneDrive\Jessica Ariadne Murphy\OneDrive\Documents"
New-Item -ItemType Junction -Path "Music" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\OneDrive\Jessica Ariadne Murphy\OneDrive\Music"
New-Item -ItemType Junction -Path "Pictures" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\OneDrive\Jessica Ariadne Murphy\OneDrive\Pictures"
New-Item -ItemType Junction -Path "Videos" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\OneDrive\Jessica Ariadne Murphy\OneDrive\Videos"

Set-Location "D:\OneDrive\Lycia Pintella\OneDrive\OneDrive Files"
cmd /c rmdir /s /q "AppData Settings and Start Menu Configuration Auto Backup"
cmd /c rmdir /s /q "Icons"
cmd /c rmdir /s /q "OneDrive Public"
cmd /c rmdir /s /q "Windows Application Installers"
cmd /c rmdir /s /q "Windows Tools And Drivers"

New-Item -ItemType Junction -Path "AppData Settings and Start Menu Configuration Auto Backup" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\AppData Settings and Start Menu Configuration Auto Backup"
New-Item -ItemType Junction -Path "Icons" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\Icons"
New-Item -ItemType Junction -Path "OneDrive Public" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\OneDrive Public"
New-Item -ItemType Junction -Path "Windows Application Installers" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\Windows Application Installers"
New-Item -ItemType Junction -Path "Windows Tools And Drivers" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\Windows Tools And Drivers"

Set-Location "D:\OneDrive\Emerald Rose Pintella\OneDrive"
cmd /c rmdir /s /q "Documents"
cmd /c rmdir /s /q "Pictures"
cmd /c rmdir /s /q "Videos"
cmd /c rmdir /s /q "Music"

New-Item -ItemType Junction -Path "Documents" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\OneDrive\Jessica Ariadne Murphy\OneDrive\Documents"
New-Item -ItemType Junction -Path "Pictures" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\OneDrive\Jessica Ariadne Murphy\OneDrive\Pictures"
New-Item -ItemType Junction -Path "Videos" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\OneDrive\Jessica Ariadne Murphy\OneDrive\Videos"
New-Item -ItemType Junction -Path "Music" -Target "D:\OneDrive\Mounted Drives\Samsung 990 PRO NVMe SSD\OneDrive\Jessica Ariadne Murphy\OneDrive\Music"

Set-Location "D:\OneDrive\Emerald Rose Pintella\OneDrive\OneDrive Files"
cmd /c rmdir /s /q "AppData Settings and Start Menu Configuration Auto Backup"
cmd /c rmdir /s /q "Icons"
cmd /c rmdir /s /q "OneDrive Public"
cmd /c rmdir /s /q "Windows Application Installers"
cmd /c rmdir /s /q "Windows Tools And Drivers"

New-Item -ItemType Junction -Path "AppData Settings and Start Menu Configuration Auto Backup" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\AppData Settings and Start Menu Configuration Auto Backup"
New-Item -ItemType Junction -Path "Icons" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\Icons"
New-Item -ItemType Junction -Path "OneDrive Public" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\OneDrive Public"
New-Item -ItemType Junction -Path "Windows Application Installers" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\Windows Application Installers"
New-Item -ItemType Junction -Path "Windows Tools And Drivers" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\Windows Tools And Drivers"
#>
<# OLD COPY OF THE CODE FROM THE COMBINED POWERSHELL SCRIPT #>

<# PART FIVE - LINKED ONEDRIVE ACCOUNTS DYNAMIC LINK SECTION #>
<#
Set-Location "D:\OneDrive\Lycia Pintella\OneDrive"
# cmd /c rmdir /s /q "Documents"
# cmd /c rmdir /s /q "Music"
# cmd /c rmdir /s /q "Pictures"
# cmd /c rmdir /s /q "Videos"

New-Item -ItemType Junction -Path "Documents" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\Documents"
New-Item -ItemType Junction -Path "Music" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\Music"
New-Item -ItemType Junction -Path "Pictures" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\Pictures"
New-Item -ItemType Junction -Path "Videos" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\Videos"

# cmd /c rmdir /s /q "Icons"
# cmd /c rmdir /s /q "OneDrive Public"
# cmd /c rmdir /s /q "Windows Application Installers"
# cmd /c rmdir /s /q "Windows Tools And Drivers"

New-Item -ItemType Junction -Path "AppData Settings and Start Menu Configuration Auto Backup" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\AppData Settings and Start Menu Configuration Auto Backup"
New-Item -ItemType Junction -Path "Icons" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\Icons"
New-Item -ItemType Junction -Path "OneDrive Public" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\OneDrive Public"
New-Item -ItemType Junction -Path "Windows Application Installers" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\Windows Application Installers"
New-Item -ItemType Junction -Path "Windows Tools And Drivers" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\Windows Tools And Drivers"

Set-Location "D:\OneDrive\Emerald Rose Pintella\OneDrive"
# cmd /c rmdir /s /q "Documents"
# cmd /c rmdir /s /q "Pictures"
# cmd /c rmdir /s /q "Videos"
# cmd /c rmdir /s /q "Music"

New-Item -ItemType Junction -Path "Documents" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\Documents"
New-Item -ItemType Junction -Path "Pictures" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\Pictures"
New-Item -ItemType Junction -Path "Videos" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\Videos"
New-Item -ItemType Junction -Path "Music" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\Music"

Set-Location "D:\OneDrive\Emerald Rose Pintella\OneDrive\OneDrive Files"
# cmd /c rmdir /s /q "AppData Settings and Start Menu Configuration Auto Backup"
# cmd /c rmdir /s /q "Icons"
# cmd /c rmdir /s /q "OneDrive Public"
# cmd /c rmdir /s /q "Windows Application Installers"
# cmd /c rmdir /s /q "Windows Tools And Drivers"

New-Item -ItemType Junction -Path "AppData Settings and Start Menu Configuration Auto Backup" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\AppData Settings and Start Menu Configuration Auto Backup"
New-Item -ItemType Junction -Path "Icons" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\Icons"
New-Item -ItemType Junction -Path "OneDrive Public" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\OneDrive Public"
New-Item -ItemType Junction -Path "Windows Application Installers" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\Windows Application Installers"
New-Item -ItemType Junction -Path "Windows Tools And Drivers" -Target "D:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\Windows Tools And Drivers"
cmd /c rmdir /s /q "Music"

New-Item -ItemType Junction -Path "Documents" -Target "C:\OneDrive\Jessica Ariadne Murphy\OneDrive\Documents"
New-Item -ItemType Junction -Path "Pictures" -Target "C:\OneDrive\Jessica Ariadne Murphy\OneDrive\Pictures"
New-Item -ItemType Junction -Path "Videos" -Target "C:\OneDrive\Jessica Ariadne Murphy\OneDrive\Videos"
New-Item -ItemType Junction -Path "Music" -Target "C:\OneDrive\Jessica Ariadne Murphy\OneDrive\Music"

Set-Location "E:\OneDrive\Emerald Rose Pintella\OneDrive\OneDrive Files"
cmd /c rmdir /s /q "AppData Settings and Start Menu Configuration Auto Backup"
cmd /c rmdir /s /q "Icons"
cmd /c rmdir /s /q "OneDrive Public"
cmd /c rmdir /s /q "Windows Application Installers"
cmd /c rmdir /s /q "Windows Tools And Drivers"

New-Item -ItemType Junction -Path "AppData Settings and Start Menu Configuration Auto Backup" -Target "C:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\AppData Settings and Start Menu Configuration Auto Backup"
New-Item -ItemType Junction -Path "Icons" -Target "C:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\Icons"
New-Item -ItemType Junction -Path "OneDrive Public" -Target "C:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\OneDrive Public"
New-Item -ItemType Junction -Path "Windows Application Installers" -Target "C:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\Windows Application Installers"
New-Item -ItemType Junction -Path "Windows Tools And Drivers" -Target "C:\OneDrive\Jessica Ariadne Murphy\OneDrive\OneDrive Files\Windows Tools And Drivers"
#>

*/