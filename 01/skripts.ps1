$computerName = $env:COMPUTERNAME
$os = Get-CimInstance -ClassName Win32_OperatingSystem
$osName = $os.Caption
$osBuild = $os.BuildNumber
$psVersion = $PSVersionTable.PSVersion.ToString()
$currentTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$processCount = (Get-Process).Count

Write-Output "Datora nosaukums: $computerName"
Write-Output "Operētājsistēmas nosaukums un būvējums: $osName (Būvējums: $osBuild)"
Write-Output "PowerShell versija: $psVersion"
Write-Output "Pašreizējais datums un laiks: $currentTime"
Write-Output "Aktīvo procesu skaits: $processCount"
