Get-AppxPackage -AllUsers MicrosoftWindows.Client.WebExperience |
ForEach-Object {
	Remove-AppxPackage -AllUsers -Package $_.PackageFullName
}
winget install Microsoft.WindowsWebExperiencePack --source msstore

# Needed to go to https://apps.microsoft.com/detail/9mssgkg348sp?hl=en-US&gl=US because winget couldn't find the experience host. Removing and reinstalling the web experience did case the widget panel to vanish for a moment on the new account, but it came back after the reinstall finished. However, my main account still cannot see the widget panel.
