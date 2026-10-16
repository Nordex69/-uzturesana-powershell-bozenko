$draiveri = Get-CimInstance -ClassName Win32_PnPSignedDriver | Where-Object { $_.Manufacturer -ne 'Microsoft' -and $_.Manufacturer -ne $null }
$draiveri | Select-Object DeviceName, Manufacturer, DriverVersion | Export-Csv -Path "drivers.csv" -NoTypeInformation -Encoding UTF8

$rindas = (Import-Csv -Path "drivers.csv").Count
Write-Output "CSV failā ir $rindas rindas."
