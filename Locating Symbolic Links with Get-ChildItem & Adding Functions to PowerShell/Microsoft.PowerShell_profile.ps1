<# Get the size of Google Drive's Streaming Cahce #>

function Get-GDriveCacheSize {
    [CmdletBinding()]
    param(
        [string]
        $CachePath = "$env:LOCALAPPDATA\Google\DriveFS"
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

    if ($totalBytes -eq $null) {
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
Set-Alias gdcache Get-GDriveCacheSize




<# Recursively Find Symbolic Links Under The Current Directory.
			Run as:
		     Get-Symlinks
	     Get-Symlinks -OnlySymbolic #>

function Get-Symlinks {
  [CmdletBinding()]
  param(
    [string]$Path       = '.',
    [switch]$OnlySymbolic
  )
  $gciParams = @{
    Path            = $Path
    Recurse         = $true
    Force           = $true
    Attributes      = 'ReparsePoint'
    ErrorAction     = 'SilentlyContinue'
  }
  if ($PSVersionTable.PSVersion.Major -ge 7) {
    $gciParams['FollowSymlink'] = $false
  }

  $items = Get-ChildItem @gciParams

  if ($OnlySymbolic) {
    $items = $items | Where-Object LinkType -eq 'SymbolicLink'
  }

  $items | Select-Object FullName, LinkType, Target
}