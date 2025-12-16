<#"C:\OneDrive\JessicaAriadneMurphy\OneDrive\OneDriveFiles\TotalWarWarhammerIII-OneDriveBackups\TotalWarWarhammerIII-PowerShellScripts"continues#>

Get-ChildItem "D:\Games\Runcher Secondary Mods Folder\pharaoh_dynasties" -Filter *.pack -Recurse -File | Select-String -Pattern 'poseiden' -List | Select-Object -ExpandProperty Path -Unique | Format-Wide

Get-ChildItem "d:\games\Steam Library\SteamApps\common\Total War PHARAOH DYNASTIES\data" -Filter *.pack -Recurse -File | Select-String -Pattern 'poseiden' -List | Select-Object -ExpandProperty Path -Unique | Format-Wide




#DirectoryListShortName
Get-ChildItem-Name
Get-ChildItem-NameFormat-Wide

#DirectoryListWideFormat

Get-ChildItem | Format-Wide

#DirectoryListFullName
Get-ChildItem | Select-Object -ExpandPropertyFullName
Get-ChildItem | Select-Object -ExpandPropertyFullName | Format-Wide

# ! THIS FINDS SymbolicLink Under the Current Directory but throws an error on broken SymbolicLinks!
Get-ChildItem -Recurse -Force -Attributes ReparsePoint | Where-Object LinkType -eq 'SymbolicLink' | Format-Wide

# ? THIS FINDS JUNCTIONS BUT THROWS AN ERROR ON BROKEN JUNCTION LINKS !!
Get-ChildItem -Recurse -Force -Attributes ReparsePoint | Where-Object LinkType -eq 'Junction' | Format-Wide


# & RUN THIS COMMAND IN POWERSHELL TO CREATE FUNCTIONS YOU CAN CALL ANYTIME:

# ! notepad $Profile


<# * Drop this into your PowerShell profile. It
- Suppresses errors
- Won’t recurse through links in PS 7+
- Filters pure symlinks
- Shows you each link’s target#>

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

# ^ TO RUN THE FUNCTION LATER, SIMPLY PASTE THE FOLLOWING LINES INTO POWERSHELL, OR CREATE A .PS1 FILE AND RUN IT.
# ~all reparse points, no errors
Get-Symlinks
Get-Symlinks –OnlySymbolic # ^Only SymbolicLinks
