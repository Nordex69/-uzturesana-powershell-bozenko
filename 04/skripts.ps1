$services = Get-CimInstance -ClassName Win32_Service | Where-Object { $_.StartMode -eq 'Auto' -and $_.State -eq 'Stopped' }
$count = ($services).Count
if ($null -eq $count) { $count = 0 }

Write-Output "Found services count: $count"

if ($count -gt 0) {
    foreach ($s in $services) {
        Start-Service -Name $s.Name -WhatIf
    }
} else {
    Write-Output "No services found with Automatic start mode and Stopped state."
}
