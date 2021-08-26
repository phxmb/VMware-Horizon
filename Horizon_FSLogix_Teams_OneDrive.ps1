#FSLogix Installation#
Start-BitsTransfer -Source 'https://aka.ms/fslogix_download' -Destination 'c:\gold\fslogix.zip' -Priority High -TransferPolicy Always -ErrorAction Continue -ErrorVariable $ErrorBits
Expand-Archive -Path 'C:\gold\fslogix.zip' -DestinationPath 'C:\gold\fslogix\'  -Force
Start-Process -FilePath 'C:\gold\fslogix\x64\Release\FSLogixAppsSetup.exe' -ArgumentList '/install /quiet /norestart' -Wait

#Teams per Machine Installation#
Start-BitsTransfer -Source 'https://teams.microsoft.com/downloads/desktopurl?env=production&plat=windows&arch=x64&managedInstaller=true&download=true' -Destination 'c:\gold\Teams_windows_x64.msi' -Priority High -TransferPolicy Always -ErrorAction Continue -ErrorVariable $ErrorBits
New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Teams' -Force | Out-Null
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Teams' -Name 'IsWVDEnvironment' -Value '1' -PropertyType DWORD -Force | Out-Null
Start-Process msiexec.exe -Wait -ArgumentList '/I C:\gold\Teams_windows_x64.msi /quiet /l*v C:\gold\teamsinstall.log ALLUSER=1 ALLUSERS=1 OPTIONS="noAutoStart=true'

#OneDrive pre Machine Installation#
Start-BitsTransfer -Source 'https://go.microsoft.com/fwlink/?linkid=844652' -Destination 'c:\gold\OneDriveSetup.exe' -Priority High -TransferPolicy Always -ErrorAction Continue -ErrorVariable $ErrorBits
Start-Process -FilePath 'c:\gold\OneDriveSetup.exe' -ArgumentList '/allusers'
