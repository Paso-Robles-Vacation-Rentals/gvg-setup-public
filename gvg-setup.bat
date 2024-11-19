# Enable on-screen keyboard
# Define the registry path and property name
$RegistryPath = "HKCU:\Software\Microsoft\TabletTip\1.7"
# Ensure the registry key exists
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}
# Set the registry property
Set-ItemProperty -Path $RegistryPath -Name "EnableDesktopModeAutoInvoke" -Value 1 -Type DWord

# Delete self
start "" cmd /c del "%~f0"
