<#
.SYNOPSIS
    This PowerShell script disables Basic authentication for the Windows Remote Management (WinRM) service to comply with STIG WN11-CC-000345.

.NOTES
    Author          : Komlavi Dekpe
    LinkedIn        : https://www.linkedin.com/in/komlavi-dekpe-8136b0317/
    GitHub          : https://github.com/komlavidekpe
    Date Created    : 11/08/2025
    Last Modified   : 11/08/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000345

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script with administrative privileges to disable Basic authentication in WinRM.

    Example syntax:
    PS C:\> .\Remediate_STIG_WN11-CC-000345.ps1
#>

#SCRIPT

SCRIPT

# WN11-CC-000345 - Disable Basic authentication for WinRM (Service and Client)
# This uses policy registry keys so it works even if WinRM is not currently configured.

# WinRM policy paths
$servicePath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service"
$clientPath  = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client"

# Ensure policy paths exist
foreach ($path in @($servicePath, $clientPath)) {
    if (-not (Test-Path $path)) {
        New-Item -Path $path -Force | Out-Null
    }

    # Set AllowBasic = 0 (Basic authentication disabled)
    New-ItemProperty -Path $path -Name "AllowBasic" -Value 0 -PropertyType DWord -Force | Out-Null
}
