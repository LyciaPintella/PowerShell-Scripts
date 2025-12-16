$folders = @(
  "E:\OD\Cejesti",
  "E:\OD\Cejesti\OneDrive",
  "E:\OD\Erelyn",
  "E:\OD\Erelyn\OneDrive"
)

foreach ($path in $folders) {
  # Get existing ACL
  $acl = Get-Acl $path

  # Remove any Deny rule for Everyone delete rights
  $denyRules = $acl.Access |
    Where-Object {
      $_.IdentityReference -eq 'Everyone' -and
      $_.FileSystemRights -match 'DeleteSubdirectoriesAndFiles' -and
      $_.AccessControlType -eq 'Deny'
    }
  foreach ($rule in $denyRules) {
    $acl.RemoveAccessRule($rule)
  }

  # Re-enable inheritance and apply
  $acl.SetAccessRuleProtection($false, $true)
  Set-Acl -Path $path -AclObject $acl
}
