<#.SYNOPSIS
  Repairs or re-registers all Microsoft Store apps for every user.

.DESCRIPTION
  This script enumerates all installed Store packages, attempts to run
  Repair-AppxPackage on each one, and if that fails, falls back to
  re-registering the app manifest. Outputs a summary at the end.

.NOTES
  · Requires running as Administrator.
  · Tested on Windows 10/11 builds that include the Repair-AppxPackage cmdlet.
#>

#region — Ensure running elevated
if (-not ([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent()
    ).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "This script must be run as Administrator."
    exit 1
}
#endregion

#region — Start transcript for logging
$logPath = "$env:USERPROFILE\Repair-StoreApps_$(Get-Date -Format yyyyMMdd_HHmmss).log"
Start-Transcript -Path $logPath -Force
#endregion

#region — Gather all Store packages
Write-Host "Retrieving all Store packages…" -ForegroundColor Cyan
$packages = Get-AppxPackage -AllUsers
$total = $packages.Count
Write-Host "Found $total packages." -ForegroundColor Green
#endregion

#region — Repair loop with fallback
$results = [System.Collections.Generic.List[PSCustomObject]]::new()

for ($i = 0; $i -lt $packages.Count; $i++) {
    $pkg = $packages[$i]
    $name = $pkg.Name
    $fullName = $pkg.PackageFullName

    Write-Host "[$($i+1)/$total] Processing $name…" -NoNewline
    $status = ""
    try {
        Repair-AppxPackage -PackageFullName $fullName -ForceApplicationShutdown -ErrorAction Stop
        $status = "Repaired"
        Write-Host " Repaired" -ForegroundColor Green
    }
    catch {
        Write-Warning " Repair failed; attempting re-registration."
        try {
            Add-AppxPackage -DisableDevelopmentMode `
                            -Register "$($pkg.InstallLocation)\AppXManifest.xml" `
                            -ErrorAction Stop
            $status = "Re-registered"
            Write-Host " Re-registered" -ForegroundColor Yellow
        }
        catch {
            $status = "Failed"
            Write-Host " Failed" -ForegroundColor Red
        }
    }

    # Record result
    $results.Add([PSCustomObject]@{
        Name            = $name
        PackageFullName = $fullName
        Status          = $status
    })
}
#endregion

#region — Summary report
Stop-Transcript
Write-Host "`n=== Repair Summary ===" -ForegroundColor Cyan
$results | Group-Object Status | ForEach-Object {
    Write-Host "$($_.Count) apps $_.Name"
}
Write-Host "`nDetailed log saved to $logPath`n" -ForegroundColor Green
#endregion
