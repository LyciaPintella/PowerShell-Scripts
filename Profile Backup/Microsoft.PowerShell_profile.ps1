# Ensure profile exists
if (-not (Test-Path -Path $PROFILE)) {
	New-Item -ItemType File -Path $PROFILE -Force | Out-Null
}

# ! Clear Stuck Recycle Bin Items
function Clear-StuckRecycleBin {
	[CmdletBinding()]
	param(
		[switch]$WhatIf
	)

	# Try the supported cmdlet first
	if (Get-Command -Name Clear-RecycleBin -ErrorAction SilentlyContinue) {
		if ($WhatIf) {
			Write-Host "Preview: Clear-RecycleBin -Confirm:$false -WhatIf" -ForegroundColor Cyan
			Clear-RecycleBin -Confirm:$false -WhatIf
		}
		else {
			Write-Host "Running Clear-RecycleBin for current user..." -ForegroundColor Cyan
			Clear-RecycleBin -Confirm:$false -Force
		}
	}
	else {
		Write-Host "Clear-RecycleBin not available in this session; skipping to force removal." -ForegroundColor Yellow
	}

	# If user asked for force removal or if items remain, enumerate drives and remove $Recycle.Bin contents
	Write-Host "Enumerating drives for $Recycle.Bin folders..." -ForegroundColor Yellow
	$drives = Get-PSDrive -PSProvider FileSystem | Select-Object -ExpandProperty Root

	foreach ($root in $drives) {
		$rbPath = Join-Path -Path $root -ChildPath '$Recycle.Bin'
		if (Test-Path $rbPath) {
			Write-Host "Found: $rbPath" -ForegroundColor Green
			if ($WhatIf) {
				Get-ChildItem -Path $rbPath -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -WhatIf
			}
			else {
				try {
					# Attempt to take ownership and grant Administrators full control (may require elevation)
					takeown.exe /f $rbPath /r /d y | Out-Null
					icacls.exe $rbPath /grant Administrators:F /t | Out-Null
				}
				catch {
					# ignore ownership errors and continue
				}
				Get-ChildItem -Path $rbPath -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
			}
		}
	}

	Write-Host "Done. If some items remain, try running PowerShell as Administrator and re-run this command." -ForegroundColor Cyan
}

# Create a short alias.
if (-not (Get-Alias -Name EmptyRecycleBin -ErrorAction SilentlyContinue)) {
	Set-Alias -Name EmptyRecycleBin -Value Clear-StuckRecycleBin
}

<# ! Remove DENY DELETE permissions from the selected folders #>
function Remove-OD-Denies {
	<#
    .SYNOPSIS
    Removes “Deny – Delete subfolders and files” ACL entries for Everyone
    under specified OneDrive folders.

    .DESCRIPTION
    Iterates a list of folder paths, reports any Deny-Delete rules found,
    attempts to remove them, re-enables inheritance, and verifies success.
    #>

	[CmdletBinding()]
	param(
		[string[]]$Folders = @(
			"E:\OD\Cejesti",
			"E:\OD\Cejesti\OneDrive",
			"E:\OD\Erelyn",
			"E:\OD\Erelyn\OneDrive",
			"E:\OD\Jessica",
			"E:\OD\Jessica\OneDrive",
			"E:\OD\Lycia",
			"E:\OD\Lycia\OneDrive",
			"E:\OD\Rose",
			"E:\OD\Rose\OneDrive"
		)
	)

	foreach ($path in $Folders) {
		Write-Host "Processing folder: $path"

		if (-not (Test-Path $path)) {
			Write-Warning "  → Path not found. Skipping."
			continue
		}

		$acl = Get-Acl -Path $path
		$denyRules = $acl.Access |
		Where-Object {
			$_.IdentityReference -eq 'Everyone' -and
			$_.FileSystemRights -match 'DeleteSubdirectoriesAndFiles' -and
			$_.AccessControlType -eq 'Deny'
		}

		if ($denyRules.Count -eq 0) {
			Write-Host "  → No Deny-Delete rules found."
		}
		else {
			Write-Host "  → Found $($denyRules.Count) Deny-Delete rule(s). Attempting removal..."

			foreach ($rule in $denyRules) {
				$acl.RemoveAccessRule($rule)
			}

			# Preserve inherited rules and remove explicit protection
			$acl.SetAccessRuleProtection($false, $true)

			try {
				Set-Acl -Path $path -AclObject $acl

				# Verify
				$newAcl = Get-Acl -Path $path
				$stillDenied = $newAcl.Access |
				Where-Object {
					$_.IdentityReference -eq 'Everyone' -and
					$_.FileSystemRights -match 'DeleteSubdirectoriesAndFiles' -and
					$_.AccessControlType -eq 'Deny'
				}

				if ($stillDenied.Count -eq 0) {
					Write-Host "  → ✔ Successfully removed all Deny-Delete rules."
				}
				else {
					Write-Warning "  → ✖ Removal attempted, but $($stillDenied.Count) rule(s) still present."
				}
			}
			catch {
				Write-Error "  → Error applying ACL: $_"
			}
		}

		Write-Host ""  # Blank line for readability
	}
}
# Create a short alias.
if (-not (Get-Alias -Name OneDriveSecurity -ErrorAction SilentlyContinue)) {
	Set-Alias -Name OneDriveSecurity -Value Remove-OD-Denies
}


<# ! Recursively Find Symbolic Links Under The Current Directory.
			Run as:
		     Get-Symlinks
			#$Get-Symlinks -Symbolic#>

function Get-Symlinks {
	[CmdletBinding()]
	param(
		[string]$Path = '.',
		[switch]$Symbolic,
		[switch]$Directory
	)
	$gciParams = @{
		Path        = $Path
		Recurse     = $true
		Force       = $true
		Attributes  = 'ReparsePoint'
		ErrorAction = 'SilentlyContinue'
	}
	if ($PSVersionTable.PSVersion.Major -ge 7) {
		$gciParams['FollowSymlink'] = $false
	}

	$items = Get-ChildItem @gciParams

	if ($Symbolic) {
		$items = $items | Where-Object $_.LinkType -eq 'SymbolicLink'
	}
	else {
		if ($Directory) {
			$items = $items | Where-Object { $_.LinkType -eq 'Directory' }
		}
		else {
			$items = $items | Where-Object { $_.LinkType -eq 'SymbolicLink', 'Directory' }
		}
	}

	$items | Select-Object FullName, LinkType, Target
}
# Create a short alias.
if (-not (Get-Alias -Name SymLinks -ErrorAction SilentlyContinue)) {
	Set-Alias SymLinks Get-Symlinks
}

# ! Get Google Drive Total File Size
function Get-ODriveSize {
	[CmdletBinding()]
	param(
		[string]
		$CachePath = "e:\od"
	)

	if (-not (Test-Path $CachePath)) {
		Write-Error "Cache path '$CachePath' does not exist."
		return
	}

	# Sum all file lengths under the cache directory
	$totalBytes = Get-ChildItem -Path $CachePath -Recurse -Force `
	| Where-Object { -not $_.PSIsContainer } `
	| Measure-Object -Property Length -Sum `
	| Select-Object -ExpandProperty Sum

	if ($null -eq $totalBytes) {
		Write-Output "No files found under '$CachePath'."
		return
	}

	# Convert to human-readable units
	$sizeGB = [math]::Round($totalBytes / 1GB, 2)
	$sizeMB = [math]::Round($totalBytes / 1MB, 2)

	[PSCustomObject]@{
		CachePath = $CachePath
		Bytes     = $totalBytes
		MB        = "$sizeMB MB"
		GB        = "$sizeGB GB"
	}
}
if (-not (Get-Alias -Name odsize -ErrorAction SilentlyContinue)) {
	Set-Alias -Name odsize -Value Get-ODriveSize
}

# ! Get Google Drive Total File Size
function Get-GDriveSize {
	[CmdletBinding()]
	param(
		[string]
		$CachePath = "F:\Google Drive"
	)

	if (-not (Test-Path $CachePath)) {
		Write-Error "Cache path '$CachePath' does not exist."
		return
	}

	# Sum all file lengths under the cache directory
	$totalBytes = Get-ChildItem -Path $CachePath -Recurse -Force `
	| Where-Object { -not $_.PSIsContainer } `
	| Measure-Object -Property Length -Sum `
	| Select-Object -ExpandProperty Sum

	if ($null -eq $totalBytes) {
		Write-Output "No files found under '$CachePath'."
		return
	}

	# Convert to human-readable units
	$sizeGB = [math]::Round($totalBytes / 1GB, 2)
	$sizeMB = [math]::Round($totalBytes / 1MB, 2)

	[PSCustomObject]@{
		CachePath = $CachePath
		Bytes     = $totalBytes
		MB        = "$sizeMB MB"
		GB        = "$sizeGB GB"
	}
}
if (-not (Get-Alias -Name gdsize -ErrorAction SilentlyContinue)) {
	Set-Alias -Name gdsize -Value Get-GDriveSize
}

# ! Get Google Drive Temporary File Size
function Get-GDriveTempSize {
	[CmdletBinding()]
	param(
		[string]
		$CachePath = "D:\Temp\GoogleDriveFS"
	)

	if (-not (Test-Path $CachePath)) {
		Write-Error "Cache path '$CachePath' does not exist."
		return
	}

	# Sum all file lengths under the cache directory
	$totalBytes = Get-ChildItem -Path $CachePath -Recurse -Force `
	| Where-Object { -not $_.PSIsContainer } `
	| Measure-Object -Property Length -Sum `
	| Select-Object -ExpandProperty Sum

	if ($null -eq $totalBytes) {
		Write-Output "No files found under '$CachePath'."
		return
	}

	# Convert to human-readable units
	$sizeGB = [math]::Round($totalBytes / 1GB, 2)
	$sizeMB = [math]::Round($totalBytes / 1MB, 2)

	[PSCustomObject]@{
		CachePath = $CachePath
		Bytes     = $totalBytes
		MB        = "$sizeMB MB"
		GB        = "$sizeGB GB"
	}
}
if (-not (Get-Alias -Name gdtemp -ErrorAction SilentlyContinue)) {
	Set-Alias -Name gdtemp -Value Get-GDriveTempSize
}

# ! Get Google Drive Streaming Cache Size
function Get-GDriveCacheSize {
	[CmdletBinding()]
	param(
		[string]
		$CachePath = "D:\Google Drive Streaming Cache\DriveFS"
	)

	if (-not (Test-Path $CachePath)) {
		Write-Error "Cache path '$CachePath' does not exist."
		return
	}

	# Sum all file lengths under the cache directory
	$totalBytes = Get-ChildItem -Path $CachePath -Recurse -Force `
	| Where-Object { -not $_.PSIsContainer } `
	| Measure-Object -Property Length -Sum `
	| Select-Object -ExpandProperty Sum

	if ($null -eq $totalBytes) {
		Write-Output "No files found under '$CachePath'."
		return
	}

	# Convert to human-readable units
	$sizeGB = [math]::Round($totalBytes / 1GB, 2)
	$sizeMB = [math]::Round($totalBytes / 1MB, 2)

	[PSCustomObject]@{
		CachePath = $CachePath
		Bytes     = $totalBytes
		MB        = "$sizeMB MB"
		GB        = "$sizeGB GB"
	}
}
if (-not (Get-Alias -Name gdcache -ErrorAction SilentlyContinue)) {
	Set-Alias -Name gdcache -Value Get-GDriveCacheSize
}
