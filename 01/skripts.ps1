$computerName = $env:COMPUTERNAME
$os = Get-CimInstance -ClassName Win32_OperatingSystem

Write-Output "Computer Name: $computerName"
Write-Output "Operating System: $($os.Caption)"
Write-Output "Build Number: $($os.BuildNumber)"
Write-Output "PowerShell Version: $($PSVersionTable.PSVersion)"
Write-Output "Current Date and Time: $(Get-Date)"
Write-Output "Process Count: $(Get-Process).Count"
