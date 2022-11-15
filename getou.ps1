$strFilter = "(&(objectCategory=User)(samAccountName=$env:username))"
$objSearcher = New-Object System.DirectoryServices.DirectorySearcher
$objSearcher.Filter = $strFilter
$objPath = $objSearcher.FindOne()
$objUser = $objPath.GetDirectoryEntry()
$DN = $objUser.distinguishedName
$ADVal = [ADSI]"LDAP://$DN"
$WorkOU = $ADVal.Parent
$WorkOU