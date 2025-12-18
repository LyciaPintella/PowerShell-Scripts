Get-AppxPackage MicrosoftWindows.Client.WebExperience |
  ForEach-Object { Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml" }

# close Widgets / sign out first, then delete cache:
Remove-Item -Path "$env:LOCALAPPDATA\Packages\MicrosoftWindows.Client.WebExperience_* \LocalCache" -Recurse -Force -ErrorAction SilentlyContinue

Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name TaskbarDa -Value 1 -Type DWord


Get-AppxPackage -AllUsers MicrosoftWindows.Client.WebExperience |
ForEach-Object {
  Remove-AppxPackage -AllUsers -Package $_.PackageFullName
}

cd "E:\OD\Jessica\OneDrive\Jess Files\Windows Application Installers"
.\"Microsoft EdgeWebView2 Runtime x64.exe"
