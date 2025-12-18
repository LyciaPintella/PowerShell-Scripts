
# 1. Define paths
$rawPath    = 'F:\Linux_Distros_And_Tools'
$longPrefix = '\\?\'
$longTarget = $longPrefix + $rawPath.TrimStart('\')

# 2. Stop locking processes
Get-Process *cygwin* -ErrorAction SilentlyContinue |
  Stop-Process -Force -ErrorAction SilentlyContinue

# 3. Take ownership and grant full control
Start-Process -FilePath takeown `
  -ArgumentList "/F `"$rawPath`" /R /D Y" `
  -NoNewWindow -Wait

Start-Process -FilePath icacls `
  -ArgumentList "`"$rawPath`" /grant Everyone:F /T /C" `
  -NoNewWindow -Wait

# 4. Attempt .NET API deletion (handles long paths natively)
try {
  [System.IO.Directory]::Delete($longTarget, $true)
  Write-Host "Deleted via .NET Directory.Delete()" -ForegroundColor Green
}
catch {
  Write-Warning "Direct .NET delete failed. Falling back to item-wise removal."

  # 5. Fallback: enumerate and delete deepest items first
  Get-ChildItem -LiteralPath $longTarget -Recurse -Force -ErrorAction SilentlyContinue |
    Sort-Object FullName -Descending |
    ForEach-Object {
      # Prepend \\?\ to each child FullName
      $childLong = $longPrefix + $_.FullName.TrimStart('\')
      Remove-Item -LiteralPath $childLong -Force -ErrorAction SilentlyContinue
    }

  # 6. Finally, remove the empty root
  Remove-Item -LiteralPath $longTarget -Force -ErrorAction Stop
  Write-Host "Deleted via fallback loop" -ForegroundColor Yellow
}
