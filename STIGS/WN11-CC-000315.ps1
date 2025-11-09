<#
.SYNOPSIS
    This PowerShell script ensures the Windows Installer setting "Always install with elevated privileges" is disabled in both HKLM and HKCU to comply with STIG WN11-CC-000315.

.NOTES
    Author          : Komlavi Dekpe
    LinkedIn        : https://www.linkedin.com/in/komlavi-dekpe-8136b0317/
    GitHub          : https://github.com/komlavidekpe
    Date Created    : 11/07/2025
    Last Modified   : 11/07/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000315

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script with administrative privileges to disable the "Always install with elevated privileges" policy.

    Example syntax:
    PS C:\> .\Remediate_STIG_WN11-CC-000315.ps1
#>

#SCRIPT

# Local machine hive
$lmKey = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer'
if (-not (Test-Path $lmKey)) {
    # Create the missing Installer key
    New-Item -Path $lmKey -Force | Out-Null
}
# Set AlwaysInstallElevated to 0 (disabled)
New-ItemProperty -Path $lmKey -Name 'AlwaysInstallElevated' -Value 0 -PropertyType DWord -Force

# Optional: enforce the same under the current user hive
$cuKey = 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\Installer'
if (-not (Test-Path $cuKey)) {
    New-Item -Path $cuKey -Force | Out-Null
}
New-ItemProperty -Path $cuKey -Name 'AlwaysInstallElevated' -Value 0 -PropertyType DWord -Force
