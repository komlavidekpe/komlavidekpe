<#
.SYNOPSIS
    This PowerShell script disables Microsoft consumer experiences by setting the appropriate policy in HKLM to comply with STIG WN11-CC-000197.

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
    Run this script with administrative privileges to disable Microsoft consumer features (such as suggested apps and consumer content).

    Example syntax:
    PS C:\> .\Remediate_STIG_WN11-CC-000197.ps1
#>

SCRIPT

# WN11-CC-000197 - Disable Microsoft Consumer Experiences
$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"

# Create missing keys step by step
if (-not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies" -Name "Microsoft" -Force | Out-Null
}
if (-not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft" -Name "Windows" -Force | Out-Null
}
if (-not (Test-Path $path)) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name "CloudContent" -Force | Out-Null
}

# Create or update the policy value
New-ItemProperty -Path $path -Name "DisableWindowsConsumerFeatures" -Value 1 -PropertyType DWord -Force
