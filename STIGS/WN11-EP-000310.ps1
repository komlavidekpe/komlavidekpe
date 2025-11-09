<#
.SYNOPSIS
    This PowerShell script configures Kernel DMA Protection enumeration policy to block all incompatible external devices to comply with STIG WN11-EP-000310.

.NOTES
    Author          : Komlavi Dekpe
    LinkedIn        : https://www.linkedin.com/in/komlavi-dekpe-8136b0317/
    GitHub          : https://github.com/komlavidekpe
    Date Created    : 11/08/2025
    Last Modified   : 11/08/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-EP-000310

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script with administrative privileges to enable Kernel DMA Protection enumeration policy (Block All) for external devices incompatible with DMA protection.

    Example syntax:
    PS C:\> .\Remediate_STIG_WN11-EP-000310.ps1
#>

SCRIPT

# WN11-EP-000310 - Enable Kernel DMA Protection enumeration policy (Block All)
# STIG requires:
# Registry Hive: HKEY_LOCAL_MACHINE
# Registry Path: \SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection
# Value Name: DeviceEnumerationPolicy
# Value Type: REG_DWORD
# Value: 0  (Block All)

$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection"

# Create the policy key if it does not exist
if (-not (Test-Path $path)) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name "Kernel DMA Protection" -Force | Out-Null
}

# Set DeviceEnumerationPolicy to 0 (Block All)
New-ItemProperty -Path $path -Name "DeviceEnumerationPolicy" -Value 0 -PropertyType DWord -Force | Out-Null
