$ADClass=[System.DirectoryServices.ActiveDirectory.Domain]
$ADClass::GetCurrentDomain()

whoami /priv


Get-WmiObject -Class win32_service | select pathname

#Get services list
Get-Service

# display only running services
Get-Service | Where-Object {$_.Status -EQ "Running"}

#properties of the service object using the Get-Member
get-service | get-member

icacls "path"

Querying the configuration for the service name
sc qc "Application Name"

#This command finds the service name, executable path, display name of the service and auto starts in all the directories except C:\Windows\
wmic service get name,pathname,displayname,startmode | findstr /i "auto" | findstr /i /v "C\" | findstr /i /v "" #add quote inbetween the quotes

#display the Display Name, Status, and features of the Windows Update (wuauserv) service
get-service wuauserv | select Displayname,Status,ServiceName,Can*

# find all services that can be paused and resumed without Windows restart
Get-Service | Where-Object {$_.canpauseandcontinue -eq "True"}

#to get the type of Windows services startup type
Get-Service | select -property name,starttype

<#
There are 4 possible types of starting services:

Automatic — automatic start during Windows boot;
AutomaticDelayedStart — startup after system boot;
Manual — manual start;
Disabled — the service is disabled.#>


$path = "https://github.com/samratashok/ADModule.git"
Invoke-WebRequest -Uri $path -OutFile $ADmodule