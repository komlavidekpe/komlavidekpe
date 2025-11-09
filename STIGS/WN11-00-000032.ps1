<#
.SYNOPSIS
    This PowerShell script ensures BitLocker requires a pre-boot PIN with a minimum length of six digits to comply with STIG WN11-00-000032.

.NOTES
    Author          : Komlavi Dekpe
    LinkedIn        : https://www.linkedin.com/in/komlavi-dekpe-8136b0317/
    GitHub          : https://github.com/komlavidekpe
    Date Created    : 11/08/2025
    Last Modified   : 11/08/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000032

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script with administrative privileges to enforce a six-digit minimum BitLocker PIN for pre-boot authentication.

    Example syntax:
    PS C:\> .\Remediate_STIG_WN11-00-000032.ps1
#>

#SCRIPT

# WN11-00-000032 - Enforce BitLocker pre-boot PIN minimum length of six digits
# This setting is stored in Group Policy under the BitLocker Drive Encryption TPM configuration.

$path = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"

# Create path if it doesn't exist
if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

# Require additional authentication at startup (if you want to keep this here)
New-ItemProperty -Path $path -Name "UsePIN" -Value 1 -PropertyType DWord -Force | Out-Null

# Enforce minimum PIN length of six digits (correct value name per STIG)
New-ItemProperty -Path $path -Name "MinimumPIN" -Value 6 -PropertyType DWord -Force | Out-Null
