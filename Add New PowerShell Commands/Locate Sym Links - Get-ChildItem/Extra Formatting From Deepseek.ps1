<# In PowerShell, you can use the `-Filter` parameter of the `Get-ChildItem` cmdlet to specify additional conditions for filtering your results. The specific property and value that you would be using depends on what link type you're trying to find. Here are some examples:

1. `SymbolicLink` or `symlink` - Represents symbolic links (also known as soft links). On Windows, these are used by the cmdlets to maintain hard links between files and directories that have different names but are located in the same directory. 

Example: 1: #>

Get-ChildItem -Path "C:\Users\Jessica\AppData\Local" -Recurse -Filter '*' | Where-Object { $_.LinkType -eq 'SymbolicLink' }

<# Example 2: `Directory` - Represents directories (folders). #>

Get-ChildItem -Path "C:\Users\Jessica\AppData\Local" -Recurse -Filter '*' | Where-Object { $_.LinkType -eq 'Directory' }

<# Example 3. `File` - Represents files. #>

Get-ChildItem -Path "C:\Users\Jessica\AppData\Local" -Recurse -Filter '*' | Where-Object { $_.LinkType -eq 'File' }

<# Example 4. 'Junction' - Represents junctions (also known as hard links). They are similar to symbolic links, but they do not provide the ability to create two paths that refer to the same file independently of each other. Instead, changes made through one path reflect in others.#>

Get-ChildItem -Path "C:\Users\Jessica\AppData\Local" -Recurse -Filter '*' | Where-Object { $_.LinkType -eq 'Junction' }


Get-ChildItem -Path "C:\Users\Jessica\AppData\Local" -Recurse -Filter '*' | Where-Object { $_.LinkType -eq 'SymbolicLink', 'Directory' } 