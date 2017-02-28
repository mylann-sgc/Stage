$ProfilesDirectory = (get-itemproperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList" -Name ProfilesDirectory).ProfilesDirectory
Get-ChildItem -Path $ProfilesDirectory -filter DMC.lnk -recurse -Force | foreach ($_) {Remove-Item $_.FullName ; Copy-Item -Path \\192.168.10.28\allusers\dmc\Seven\DmC.lnk -Destination $_.DirectoryName}

Stop-Process -Name powershell