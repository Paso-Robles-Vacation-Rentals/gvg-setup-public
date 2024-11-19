##############################################
#     THIS IS A PUBLICLY AVAILIBLE FILE      #
# DO NOT ADD ANy SENSITIVE DATA TO THIS FILE #
##############################################

Write-Host "Starting gvg setup script"

Write-Host "Enabling on-screen keyboard"
$RegistryPath = "HKCU:\Software\Microsoft\TabletTip\1.7"
# Ensure the registry key exists
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}
# Set the registry property
Set-ItemProperty -Path $RegistryPath -Name "EnableDesktopModeAutoInvoke" -Value 1 -Type DWord
Write-Host "On-screen kayboard enabled"

Write-Host "Changing GVG landing page"
$filePath = "C:\bnblauncher\routes\index.js"
# Read the contents of the file
$fileContent = Get-Content -Path $filePath
# Replace the line containing var URL_PILOT
$fileContent = $fileContent -replace 'var URL_PILOT = ".*";', 'var URL_PILOT = "https://www.pasoroblesvacationrentals.com/";'
# Write the updated content back to the file
Set-Content -Path $filePath -Value $fileContent
Write-Host "GVG landing page set"

# This variable is being set outside of this script
# $AnyDeskURL = "https://download.anydesk.com/AnyDesk.msi"
$InstallerPath = "$env:TEMP\AnyDesk.msi"

Write-Output "Downloading AnyDesk..."
Invoke-WebRequest -Uri $AnyDeskURL -OutFile $InstallerPath

Write-Output "Installing AnyDesk..."
Start-Process $InstallerPath -ArgumentList "/passive" -Wait

# Clean up the installer
Write-Output "Cleaning up..."
Remove-Item -Path $InstallerPath -Force
Write-Host "Anydesk installed"

Write-Host "========================================="
Write-Host "           GVG setup complete!           "
Write-Host "     Remove Setup tool from GVG Now!     "
Write-Host "    GVG will restart in 10 seconds...    "
Write-Host "========================================="
Start-Sleep -Seconds 10
# Reboot the system
Restart-Computer -Force
