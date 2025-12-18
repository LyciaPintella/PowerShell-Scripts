# Safer VS Code Factory Reset Script
# - Supports -WhatIf and -Confirm via CmdletBinding(SupportsShouldProcess=$true)
# - Uses timestamped backups instead of overwriting existing backups
# - Tries Move-Item, falls back to Copy-Item+Remove-Item if needed
# - Optional zip of backups via -ZipBackup
# - Clearer confirmation, with -Force to skip interactive prompt
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact = 'High')]
param(
    [switch]$Force,
    [switch]$ZipBackup
)

function Confirm-OrAbort {
    param(
        [string]$Prompt = "Type 'YES' to proceed",
        [switch]$Force
    )
    if ($Force) { return $true }
    $response = Read-Host $Prompt
    return ($response -eq 'YES')
}

$paths = @(
    "$env:APPDATA\Code",
    "$env:LOCALAPPDATA\Code",
    "$env:USERPROFILE\.vscode"
)

Write-Host "The following paths will be backed up and removed:"
$paths | ForEach-Object { Write-Host "  $_" }

# Warn if VS Code is running
$codeProcs = Get-Process -Name 'Code' -ErrorAction SilentlyContinue
if ($codeProcs) {
    Write-Warning "One or more running Visual Studio Code processes detected (close them first)."
    if (-not $Force) {
        if (-not (Confirm-OrAbort -Prompt "VS Code appears to be running. Type 'YES' to continue anyway")) {
            Write-Host "Aborted by user"; return
        }
    }
}

if (-not (Confirm-OrAbort -Force:$Force)) {
    Write-Host "Aborted by user"; return
}

foreach ($p in $paths) {
    try {
        if (-not (Test-Path -LiteralPath $p)) {
            Write-Verbose "$p does not exist; skipping"
            Write-Host "$p does not exist."
            continue
        }

        # Create a unique backup path with timestamp
        $timestamp = (Get-Date).ToString('yyyyMMdd-HHmmss')
        $backupPath = "$p.backup-$timestamp"

        $actionDesc = "Backup and remove '$p' -> '$backupPath'"
        if ($PSCmdlet.ShouldProcess($p, $actionDesc)) {
            try {
                Move-Item -LiteralPath $p -Destination $backupPath -ErrorAction Stop
                Write-Host "Moved $p -> $backupPath"
            }
            catch {
                Write-Verbose "Move-Item failed for $p: $($_.Exception.Message). Attempting copy+remove fallback."
                # Fallback: copy then remove
                Copy-Item -LiteralPath $p -Destination $backupPath -Recurse -Force -ErrorAction Stop
                Remove-Item -LiteralPath $p -Recurse -Force -ErrorAction Stop
                Write-Host "Copied (fallback) $p -> $backupPath and removed original"
            }

            if ($ZipBackup) {
                try {
                    $zipName = "$backupPath.zip"
                    Compress-Archive -Path $backupPath -DestinationPath $zipName -Force
                    # Optionally remove the uncompressed backup dir after zipping
                    Remove-Item -LiteralPath $backupPath -Recurse -Force
                    Write-Host "Compressed backup to $zipName"
                }
                catch {
                    Write-Warning "Failed to compress backup: $($_.Exception.Message)"
                }
            }
        }
    }
    catch {
        Write-Warning "Failed to process path $p: $($_.Exception.Message)"
    }
}

Write-Host "Reset complete. Restart VS Code if needed. Backups are left in place (timestamped)."
