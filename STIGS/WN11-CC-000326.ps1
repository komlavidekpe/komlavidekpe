<#
.SYNOPSIS
    This PowerShell script enables PowerShell Script Block Logging to comply with STIG WN11-CC-000326.

.NOTES
    Author          : Komlavi Dekpe
    LinkedIn        : https://www.linkedin.com/in/komlavi-dekpe-8136b0317/
    GitHub          : https://github.com/komlavidekpe
    Date Created    : 11/09/2025
    Last Modified   : 11/09/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000326

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script with administrative privileges to enable PowerShell Script Block Logging.

    Example syntax:
    PS C:\> .\Remediate_STIG_WN11-CC-000326.ps1

#SCRIPT
#>

# WN11-CC-000326 - Enable PowerShell Script Block Logging
# Registry Path: HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging
# Value Name: EnableScriptBlockLogging (REG_DWORD) = 1

$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"

# Create the key if it doesn't exist
if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

# Enable Script Block Logging
New-ItemProperty -Path $path -Name "EnableScriptBlockLogging" -Value 1 -PropertyType DWord -Force | Out-Null

# Optional: Force policy refresh
gpupdate /force
