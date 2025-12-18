Get-AppxPackage -AllUsers MicrosoftWindows.Client.WebExperience |
ForEach-Object {
	Remove-AppxPackage -AllUsers -Package $_.PackageFullName
}
winget install Microsoft.WindowsWebExperiencePack --source msstore
