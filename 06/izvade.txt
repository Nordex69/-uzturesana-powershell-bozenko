PS C:\Users\bruno> $rows = (Import-Csv -Path "drivers.csv").Count
PS C:\Users\bruno> Write-Output "CSV file contains $rows rows."
CSV file contains 108 rows.
