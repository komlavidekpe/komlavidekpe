<#
.SYNOPSIS
    This PowerShell script configures the "Deny access to this computer from the network" user right to restrict access from privileged and unauthenticated accounts in compliance with STIG WN11-UR-000070.

.NOTES
    Author          : Komlavi Dekpe
    LinkedIn        : https://www.linkedin.com/in/komlavi-dekpe-8136b0317/
    GitHub          : https://github.com/komlavidekpe
    Date Created    : 11/08/2025
    Last Modified   : 11/08/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-UR-000070

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script with administrative privileges to apply the required "Deny access to this computer from the network" restrictions.

    Example syntax:
    PS C:\> .\Remediate_STIG_WN11-UR-000070.ps1
#>

SCRIPT

# WN11-UR-000070 - Configure 'Deny access to this computer from the network'
# STIG requires denying network logon to:
#  - Local account (S-1-5-113)
#  - Local account and member of Administrators group (S-1-5-114)
#  - Guests group (Guests)

# IMPORTANT: Run this script in an elevated PowerShell session (Run as Administrator).

# Paths for temporary files
$tempInf = "$env:TEMP\WN11-UR-000070.inf"
$tempSdb = "$env:TEMP\WN11-UR-000070.sdb"

# Build a valid security template (note: correct signature and Unicode encoding)
@'
[Unicode]
Unicode=yes
[Version]
signature="$CHICAGO$"
Revision=1
[Privilege Rights]
SeDenyNetworkLogonRight = *S-1-5-113,*S-1-5-114,Guests
'@ | Out-File -FilePath $tempInf -Encoding Unicode

# Apply the security policy (user rights only)
secedit /configure /db $tempSdb /cfg $tempInf /areas USER_RIGHTS

# Optional: Clean up temporary files
Remove-Item $tempInf, $tempSdb -ErrorAction SilentlyContinue
