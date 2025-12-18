Get-Symlinks Usage Guide (Plain Text)
This guide shows four ways to load and call the Get-Symlinks function in PowerShell. All commands and code are presented without code-block formatting so you can copy and paste directly.

Prerequisites

Make sure you have the Get-Symlinks function definition saved somewhere (your profile or a script file). Copy this entire block, exactly as shown, into your destination:
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

#^ Persist via Your PowerShell Profile
<#
1. Open your profile in Notepad
notepad $Profile

2. Paste the entire Get-Symlinks function definition into the file.
3. Save and close Notepad.
4. Reload your profile (or restart PowerShell)
5. Call the function by name
#^ Get-Symlinks
#& Get-Symlinks -OnlySymbolic
2. Load On-Demand from a Script File

1. Save the function definition to a file, for example:
#*C:\Scripts\Get-Symlinks.ps1
2. In any PowerShell session, dot-source the file to load it: C:\Scripts\Get-Symlinks.ps1"
3. Call the function:
& Get-Symlinks
3. Package as a PowerShell Module
1. Create a folder named Get-Symlinks under one of your module paths, for example:
C:\Users\Documents\WindowsPowerShell\Modules\Get-Symlinks
2. Inside that folder, save the function as Get-Symlinks.psm1.
3. Optionally create a module manifest:
New-ModuleManifest -Path "C:\Users\Documents\WindowsPowerShell\Modules\Get-Symlinks\Get-Symlinks.psd1" -RootModule Get-Symlinks.psm1
4. Import the module in your session:
Import-Module Get-Symlinks
5. Call the function:
Get-Symlinks
4. Additional Tips
* Create a short alias for quick access:
Set-Alias gsl Get-Symlinks
* Schedule a regular audit in Task Scheduler, piping output to Export-Csv if desired.
* Extend the function to accept wildcards, path-type filters, or custom formatting.
You can now copy and paste these steps directly into your PowerShell console or scripts without reformatting.
#>
