param(
     [Parameter (Mandatory = $true)]
     [string]$tenant = "",
     [Parameter (Mandatory = $true)]
     [string]$userMail = ""
)
[string]$userClaim = "i:0#.f|membership|"+$userMail

Import-Module PnP.PowerShell

#connect to tenant admin center
Connect-PnPOnline -url $tenant -Interactive -ForceAuthentication

# get all sites in tenant 
$allSites = (Get-PnPTenantSite).Url


foreach($site in $allSites){
    # connect to single sharepoint site
    Connect-PnPOnline -url $site -Interactive

    # get all librarys in site
    $siteLibraries = Get-PnPList | Where-Object BaseType -eq 'DocumentLibrary'

    foreach($library in $siteLibraries){

        # check all librarys for files which was created by user
        $libraryId = $library.Id
        $fileMetadata = (Get-PnPListItem -List $libraryId).FieldValues

        foreach($file in $fileMetadata){

            $author = $file.Created_x0020_By 

            if($author -eq $userClaim){
                # do some action like grant permissions to user 
                $file.FileRef
            }
        }

    }    
}