$drivers = Get-CimInstance -ClassName Win32_PnPSignedDriver | Where-Object { $_.Manufacturer -ne 'Microsoft' -and $_.Manufacturer -ne $null }
$drivers | Select-Object DeviceName, Manufacturer, DriverVersion | Export-Csv -Path "drivers.csv" -NoTypeInformation -Encoding UTF8

$rows = (Import-Csv -Path "drivers.csv").Count
Write-Output "CSV file contains $rows rows."
