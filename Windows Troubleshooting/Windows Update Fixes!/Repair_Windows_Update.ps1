# Repair Windows Update Script

# This script is designed to repair Windows Update issues by resetting components, cleaning up files, and restoring the Start Menu Programs.

#! KEEP A BACKUP OF THE START MENU CONFIGURATION
Remove-Item -Path "C:\OD\Jessica\OneDrive\Jess Files\Start Menu ProgramData Backup\Programs" -Recurse -Force
New-Item -Path "C:\OD\Jessica\OneDrive\Jess Files\Start Menu ProgramData Backup\Programs" -ItemType Directory
Copy-Item -Path "C:\OD\Jessica\OneDrive\Jess Files\Windows Tools And Drivers\Start Menu ProgramData Backup\*" -Destination "C:\OD\Jessica\OneDrive\Jess Files\Start Menu ProgramData Backup" -Recurse -Force

#! KEEP ANOTHER FUCKING BACKUP OF THE START MENU CONFIGURATION
Remove-Item -Path "F:\Start Menu ProgramData Backup\Programs" -Recurse -Force
New-Item -Path "F:\Start Menu ProgramData Backup\Programs" -ItemType Directory
Copy-Item -Path "C:\OD\Jessica\OneDrive\Jess Files\Windows Tools And Drivers\Start Menu ProgramData Backup\*" -Destination "F:\Start Menu ProgramData Backup" -Recurse -Force

#? End Backup Section

Remove-Item -Path "C:\OD\Jessica\OneDrive\Jess Files\Windows Tools And Drivers\Start Menu ProgramData Backup\Programs" -Recurse -Force
Copy-Item -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs" -Destination "C:\OD\Jessica\OneDrive\Jess Files\Windows Tools And Drivers\Start Menu ProgramData Backup" -Recurse -Force
Remove-Item -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs" -Recurse -Force
New-Item -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs" -ItemType Directory

DISM /Online /Cleanup-Image /RestoreHealth
DISM /Online /Cleanup-Image /AnalyzeComponentStore

DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase
DISM /Online /Cleanup-Image /RestoreHealth
sfc /scannow

net stop wuauserv
net stop cryptSvc
net stop bits

Remove-Item -Path "$env:windir\SoftwareDistribution\*" -Recurse -Force
Remove-Item -Path "C:\Windows\SoftwareDistribution" -Recurse -Force
Remove-Item -Path "C:\Windows\System32\catroot2" -Recurse -Force

net start cryptSvc
net start wuauserv
net start bits

netsh winsock reset
#! REBOOT NEEDED HERE FOR WINSOCK RESET TO TAKE EFFECT

#? Install updates without automatic reboot
Import-Module PSWindowsUpdate
Install-WindowsUpdate -AcceptAll -IgnoreReboot

#! PAUSE HERE UNTIL REBOOT IS DONE.

# After Windows Update, restore the Start Menu Programs
Remove-Item -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs" -Recurse -Force
New-Item -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs" -ItemType Directory
Copy-Item -Path "C:\OD\Jessica\OneDrive\Jess Files\Windows Tools And Drivers\Start Menu ProgramData Backup\*" -Destination "C:\ProgramData\Microsoft\Windows\Start Menu" -Recurse -Force

<# Optional tools

f:\setup.exe /auto upgrade /dynamicupdate disable /compat ignorewarning /migratedrivers all

Start-Process ms-settings:recovery

# reboot into recovery mode
shutdown /r /o /f /t 00
#>