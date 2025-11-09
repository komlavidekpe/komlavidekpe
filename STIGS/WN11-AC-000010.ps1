<#
.SYNOPSIS
    This PowerShell script configures the account lockout threshold to three invalid logon attempts or less to comply with STIG WN11-AC-000010.

.NOTES
    Author          : Komlavi Dekpe
    LinkedIn        : https://www.linkedin.com/in/komlavi-dekpe-8136b0317/
    GitHub          : https://github.com/komlavidekpe
    Date Created    : 11/08/2025
    Last Modified   : 11/08/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000010

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script with administrative privileges to configure the account lockout threshold to three invalid logon attempts or less.

    Example syntax:
    PS C:\> .\Remediate_STIG_WN11-AC-000010.ps1
#>

SCRIPT

# WN11-AC-000010 - Configure account lockout threshold to three invalid logon attempts or less

# This uses the built-in 'net accounts' command to set the lockout threshold.
# A value of 3 means the account will lock after 3 invalid logon attempts.
# NOTE: This affects local security policy on the machine.

& net accounts /lockoutthreshold:3
