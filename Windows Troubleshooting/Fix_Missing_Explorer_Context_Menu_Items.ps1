<# Run as Administrator #>

<# 1. Close all NanaZip processes #>
Get-Process | Where-Object { $_.ProcessName -like "*NanaZip*" } | Stop-Process -Force

<# 2. Stop Explorer (which may be holding shell extension handles) #>
Stop-Process -Name explorer -Force

<# 3. Wait a moment for everything to release #>
Start-Sleep -Seconds 3

<# 4. Now try the re-registration #>
Add-AppxPackage -DisableDevelopmentMode -Register "C:\Program Files\WindowsApps\40174MouriNaruto.NanaZipPreview_6.0.1461.0_x64__gnj4mf6z9tkrc\AppxManifest.xml"

<# 5. Restart Explorer #>
Start-Process explorer

	<# !Alternative: Use the Force Update Flag #>
	<# !Alternative: Use the Force Update Flag #>


<# This allows registration even if the app is in use  #>
Add-AppxPackage -DisableDevelopmentMode -Register "C:\Program Files\WindowsApps\40174MouriNaruto.NanaZipPreview_6.0.1461.0_x64__gnj4mf6z9tkrc\AppxManifest.xml" -ForceApplicationShutdown -ForceUpdateFromAnyVersion

	<# !If All Else Fails: Complete Reinstall #>
	<# !If All Else Fails: Complete Reinstall #>

<# Kill any lingering processes #>
Get-Process | Where-Object {$_.ProcessName -like "*NanaZip*"} | Stop-Process -Force -ErrorAction SilentlyContinue

<# Remove the package #>
Get-AppxPackage *nanazip* | Remove-AppxPackage

<# Clear any lingering data #>
Remove-Item -Path "$env:LOCALAPPDATA\Packages\*NanaZip*" -Recurse -Force -ErrorAction SilentlyContinue

<# Restart Explorer #>
<# 4. Wait and restart Explorer
Start-Sleep -Seconds 2
Start-Process explorer

<# Reinstall NanaZip #>
winget install M2Team.NanaZip.Preview
