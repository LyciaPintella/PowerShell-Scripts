# Add Security Exceptions With PowerShell
Add-MpPreference -ExclusionPath "C:\program files\Google\Drive File Stream\113.0.1.0\GoogleDriveFS.exe"
Add-MpPreference -ExclusionProcess "GoogleDriveFS.exe"