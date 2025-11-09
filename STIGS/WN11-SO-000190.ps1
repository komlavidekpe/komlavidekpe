<#
.SYNOPSIS
    This PowerShell script configures the system to disallow weak Kerberos encryption types (DES and RC4) to comply with STIG WN11-SO-000190.

.NOTES
    Author          : Komlavi Dekpe
    LinkedIn        : https://www.linkedin.com/in/komlavi-dekpe-8136b0317/
    GitHub          : https://github.com/komlavidekpe
    Date Created    : 11/08/2025
    Last Modified   : 11/08/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000190

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script with administrative privileges to disable DES and RC4 Kerberos encryption types.

    Example syntax:
    PS C:\> .\Remediate_STIG_WN11-SO-000190.ps1
#>

SCRIPT

# WN11-SO-000190 - Configure Kerberos encryption types to prevent the use of DES and RC4

$path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters"

# Create the path if it doesn't exist
if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

# Set SupportedEncryptionTypes as required by STIG:
# Value: 0x7ffffff8 (2147483640)
# This effectively disables DES and RC4 and aligns with
# "AES128_HMAC_SHA1, AES256_HMAC_SHA1, Future encryption types" in the policy.
New-ItemProperty -Path $path -Name "SupportedEncryptionTypes" -Value 0x7ffffff8 -PropertyType DWord -Force | Out-Null
