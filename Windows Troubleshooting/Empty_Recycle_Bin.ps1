<#
.SYNOPSIS
  Force-empty Recycle Bin for current user and, if needed, force-remove items from all drives' $Recycle.Bin (admin required).

.NOTES
  - Run PowerShell as Administrator for the "all users / all drives" section.
  - Use -WhatIf to preview deletions.
#>

param(
	[switch]$WhatIfMode
)

function Invoke-ClearRecycleBin {
	param([switch]$WhatIfMode)

	Write-Host "Attempting Clear-RecycleBin for current user..." -ForegroundColor Cyan
	if ($WhatIfMode) {
		Clear-RecycleBin -Confirm:$false -WhatIf
	}
 else {
		Clear-RecycleBin -Confirm:$false -Force
	}
}

function Remove-RecycleBinFolders {
	param([switch]$WhatIfMode)

	Write-Host "Enumerating filesystem drives and removing $Recycle.Bin folders (requires Admin)..." -ForegroundColor Yellow

	# Get all filesystem drives (C:, D:, E:, etc.)
	$drives = Get-PSDrive -PSProvider FileSystem | Select-Object -ExpandProperty Root

	foreach ($root in $drives) {
		# Build path to the recycle bin folder on that root
		$rbPath = Join-Path -Path $root -ChildPath '$Recycle.Bin'
		if (Test-Path $rbPath) {
			Write-Host "Found: $rbPath" -ForegroundColor Green
			if ($WhatIfMode) {
				Get-ChildItem -Path $rbPath -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -WhatIf
			}
			else {
				# Try to take ownership and remove; ignore errors
				try {
					# Take ownership (may be necessary for orphaned items)
					takeown.exe /f $rbPath /r /d y | Out-Null
					icacls.exe $rbPath /grant Administrators:F /t | Out-Null
				}
				catch {
					# continue even if ownership change fails
				}
				Get-ChildItem -Path $rbPath -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
			}
		}
		else {
			Write-Host "No $rbPath on $root" -ForegroundColor DarkGray
		}
	}
}

# Main
if (-not (Get-Command Clear-RecycleBin -ErrorAction SilentlyContinue)) {
	Write-Host "Clear-RecycleBin cmdlet not available in this session; proceeding to force removal of $Recycle.Bin folders." -ForegroundColor Yellow
	Remove-RecycleBinFolders -WhatIfMode:$WhatIfMode
}
else {
	Invoke-ClearRecycleBin -WhatIfMode:$WhatIfMode

	# If items remain (e.g., stuck entries), attempt force removal for all drives
	Write-Host "If stuck items remain after Clear-RecycleBin, run the force removal step (requires Admin)." -ForegroundColor Cyan
	if ($WhatIfMode) {
		Write-Host "To preview the force removal, re-run with -WhatIfMode:$false omitted." -ForegroundColor Gray
	}
 else {
		# Prompt before doing the force removal when not in WhatIfMode
		$confirm = Read-Host "Proceed to force-remove $Recycle.Bin contents for all drives? (Y/N)"
		if ($confirm -match '^[Yy]') {
			Remove-RecycleBinFolders -WhatIfMode:$WhatIfMode
		}
		else {
			Write-Host "Skipping force removal." -ForegroundColor Gray
		}
	}
}