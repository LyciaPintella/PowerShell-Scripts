# Running PowerShell as SYSTEM using PsExec
Set-Location "E:\OD\Jessica\OneDrive\Jess Files\Windows Application Installers\PowerShell & Tools\PSTools"
.\PsExec.exe -i -s powershell.exe

# Deleting locked registry key
Remove-Item -Path "HKLM:\SYSTEM\ControlSet001\Enum\BTHENUM\Dev_1571759A0675" -Recurse -Force