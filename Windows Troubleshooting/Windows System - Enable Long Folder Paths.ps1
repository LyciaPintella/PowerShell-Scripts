#Fixes issue documented at: https://www.reddit.com/r/MDT/comments/9nd31x/comment/e7lox4c/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1

New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1 -Type DWORD –Force | Out-Null
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1 -Type DWORD –Force | Out-Null
