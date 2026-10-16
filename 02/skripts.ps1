Get-Process | Sort-Object -Property WorkingSet64 | Select-Object -Last 10 | Format-Table -Property Name, Id, WorkingSet64
