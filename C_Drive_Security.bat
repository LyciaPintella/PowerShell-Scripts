#––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# Configuration
#––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

$backupDir = "Z:\Security Backups\AclBackups"
$logFile   = "Z:\Security Backups\PermissionChangeLog.txt"
$rootPath  = "C:\"
$usersPath = "C:\Users"

# Ensure backup folder exists
if (-not (Test-Path $backupDir)) {
    New-Item -Path $backupDir -ItemType Directory -Force | Out-Null
}

#––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# Helper: Log Message with Timestamp
#––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

function Log-Message {
    param([string]$Message)
    $ts = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $logFile -Value "$ts`t$Message"
}

#––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# Step 1: Backup Original ACLs
#––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

try {
    Get-Acl $rootPath  | Export-Clixml -Path "$backupDir\AclBackup_C_Root.xml"
    Log-Message "Backed up ACL for $rootPath"
} catch {
    Log-Message "ERROR backing up ACL for $rootPath — $_"
}

try {
    Get-Acl $usersPath | Export-Clixml -Path "$backupDir\AclBackup_C_Users.xml"
    Log-Message "Backed up ACL for $usersPath"
} catch {
    Log-Message "ERROR backing up ACL for $usersPath — $_"
}

#––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# Step 2: Modify Root ACL
#––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

try {
    $acl = Get-Acl $rootPath
    $groups = @("Administrators","Users")

    foreach ($grp in $groups) {
        $rule = New-Object System.Security.AccessControl.FileSystemAccessRule(
            $grp,
            "FullControl",
            "ContainerInherit,ObjectInherit",  # propagate to folders & files
            "None",
            "Allow"
        )
        $acl.AddAccessRule($rule)
        Log-Message "Granted FullControl to '$grp' on $rootPath"
    }

    # Ensure inheritance is enabled so child items can pick up these new rules
    $acl.SetAccessRuleProtection($false, $false)

    Set-Acl -Path $rootPath -AclObject $acl
    Log-Message "Applied updated ACL to $rootPath"
}
catch {
    Log-Message "ERROR applying ACL to $rootPath — $_"
}

#––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# Step 3: Propagate ACL to All Child Items under C:\
#––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

try {
    Get-ChildItem -Path $rootPath -Recurse -Force -ErrorAction Stop |
    ForEach-Object {
        try {
            Set-Acl -Path $_.FullName -AclObject $acl
            Log-Message "Propagated ACL to $($_.FullName)"
        }
        catch {
            Log-Message "ERROR propagating ACL to $($_.FullName) — $_"
        }
    }
    Log-Message "Completed propagation of ACL from $rootPath to all descendants"
}
catch {
    Log-Message "ERROR traversing $rootPath — $_"
}

#––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# Step 4: Change Owner of C:\Users to Administrators Group
#––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

try {
    $adminAcct = New-Object System.Security.Principal.NTAccount("Administrators")
    $aclUsers = Get-Acl $usersPath
    $aclUsers.SetOwner($adminAcct)
    Set-Acl -Path $usersPath -AclObject $aclUsers
    Log-Message "Set owner of $usersPath to 'Administrators'"
}
catch {
    Log-Message "ERROR setting owner on $usersPath — $_"
}

#––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# Done
#––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

Write-Host "Script complete.
Check log: $logFile
Check backups: $backupDir"
