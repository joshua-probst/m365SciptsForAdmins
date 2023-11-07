# Read-me to script: get_AllFilesCreatedByUser.ps1

This script should find all files within SharePoint that have been created by a specific user. This can be useful if an employee has already left the company and all licenses have been removed, but access to individual documents by substitutes is not guaranteed. 

## Before you start

Make sure that you have installed the PnP.PowerShell.

### [Install PnP.PowerShell](https://pnp.github.io/powershell/)
```powershell
Install-Module PnP.PowerShell -Scope CurrentUser
```

