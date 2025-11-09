<#
.SYNOPSIS
    This PowerShell script enables success auditing for the "Other Logon/Logoff Events" subcategory using auditpol to comply with STIG WN11-AU-000560.

.NOTES
    Author          : Komlavi Dekpe
    LinkedIn        : https://www.linkedin.com/in/komlavi-dekpe-8136b0317/
    GitHub          : https://github.com/komlavidekpe
    Date Created    : 11/08/2025
    Last Modified   : 11/08/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000560

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script with administrative privileges to enable success auditing for the "Other Logon/Logoff Events" audit subcategory.

    Example syntax:
    PS C:\> .\Remediate_STIG_WN11-AU-000560.ps1
#>

SCRIPT

# WN11-AU-000560 - Enable success auditing for "Other Logon/Logoff Events"

# NOTE: This must be run in an elevated PowerShell session.
# This command enables Success auditing (and also enables Failure for more complete logging).

$auditSubcategory = "Other Logon/Logoff Events"

auditpol /set /subcategory:"$auditSubcategory" /success:enable /failure:enable
