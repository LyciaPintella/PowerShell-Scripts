# Win 11 Retail
# Identify the target USB drive (ensure correct drive letter)
$usbDrive = "T:"

# Format the USB drive
#Format-Volume -DriveLetter $usbDrive.Trim(":") -FileSystem NTFS -Confirm:$false

# Mount the ISO file
$isoPath = "E:\OD\Jessica\OneDrive\Jess Files\USB OS Installers and Tools\Windows 11 Retail 25H2 x64.iso"
$mountResult = Mount-DiskImage -ImagePath $isoPath -PassThru
$volumeInfo = $mountResult | Get-Volume

# Copy files to the USB
$isoDriveLetter = $volumeInfo.DriveLetter
xcopy "$($isoDriveLetter):\*" "$usbDrive\" /s /e

# Clean up: Unmount the ISO
Dismount-DiskImage -ImagePath $isoPath #-DevicePath $volumeInfo.DeviceID

# Win 11 Insider Preview
# Identify the target USB drive (ensure correct drive letter)
$usbDrive = "H:"

# Format the USB drive
#Format-Volume -DriveLetter $usbDrive.Trim(":") -FileSystem NTFS -Confirm:$false

# Mount the ISO file
$isoPath = "E:\OD\Jessica\OneDrive\Jess Files\USB OS Installers and Tools\Windows 11 Insider Preview x64 v22621.iso"
$mountResult = Mount-DiskImage -ImagePath $isoPath -PassThru
$volumeInfo = $mountResult | Get-Volume

# Copy files to the USB
$isoDriveLetter = $volumeInfo.DriveLetter
xcopy "$($isoDriveLetter):\*" "$usbDrive\" /s /e

# Clean up: Unmount the ISO
Dismount-DiskImage -ImagePath $isoPath #-DevicePath $volumeInfo.DeviceID

# Ubuntu Linux
# Identify the target USB drive (ensure correct drive letter)
$usbDrive = "V:"

# Format the USB drive
#Format-Volume -DriveLetter $usbDrive.Trim(":") -FileSystem NTFS -Confirm:$false

# Mount the ISO file
$isoPath = "F:\USB OS Installers and Tools\Ubuntu 24.04.2 x64.iso"
$mountResult = Mount-DiskImage -ImagePath $isoPath -PassThru
$volumeInfo = $mountResult | Get-Volume

# Copy files to the USB
$isoDriveLetter = $volumeInfo.DriveLetter
xcopy "$($isoDriveLetter):\*" "$usbDrive\" /s /e

# Clean up: Unmount the ISO
Dismount-DiskImage -ImagePath $isoPath #-DevicePath $volumeInfo.DeviceID

<#
# MemTest86
# Identify the target USB drive (ensure correct drive letter)
$usbDrive = "O:"

# Format the USB drive
#Format-Volume -DriveLetter $usbDrive.Trim(":") -FileSystem NTFS -Confirm:$false

# Mount the ISO file
$isoPath = "C:\OD\Jessica\OneDrive\Jess Files\Windows Tools And Drivers\USB OS Installers and Tools\memtest.iso"
$mountResult = Mount-DiskImage -ImagePath $isoPath -PassThru
echo $mountResult
$volumeInfo = $mountResult | Get-Volume
echo $volumeInfo

# Copy files to the USB
$isoDriveLetter = $volumeInfo.DriveLetter
xcopy "$($isoDriveLetter):\*" "$usbDrive\" /s /e

echo $isoPath
echo $volumeInfo
echo $volumeInfo.DeviceID
echo $volumeInfo.DevicePath


# Clean up: Unmount the ISO
Dismount-DiskImage -ImagePath $isoPath
#>