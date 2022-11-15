#$ping = New-Object System.Net.Networkinformation.ping
#$ipaddress
#ForEach-Object{$ping.Send($ipaddress,500)}
#[Net.DNS]::GetHostEntry(“172.19.123.254”) | Hostname
#$tcpClient = New-Object System.Net.Sockets.TCPClient
#$tcpClient.Connect(“172.19.123.254”,445)

Get-NetworkStartEndAddress.ps1 “10.0.0.0” “16”