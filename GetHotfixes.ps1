$ErrorActionPreference = 'SilentlyContinue'
$b = Get-HotFix | Select HotfixID, InstalledOn | Out-File "C:\Users\$env:UserName\Desktop\$b HotFixList.txt"

$hotfix = "C:\Users\$env:UserName\Desktop\$b HotFix.txt"

foreach($line in Get-Content $hotfix) {
		if($line -match "KB"){
            echo "Hotfix ID : $line"}}