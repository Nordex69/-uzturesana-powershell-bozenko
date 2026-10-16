Get-Process | Sort-Object -Property WorkingSet64 | Select-Object -Last 10 | ForEach-Object {
    $memoryMb = [Math]::Round($_.WorkingSet64 / 1024 / 1024, 1)
    [PSCustomObject]@{
        Nosaukums = $_.ProcessName
        Id = $_.Id
        Atmiņa_MB = $memoryMb
    }
} | Format-Table -AutoSize
