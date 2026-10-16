$services = Get-Service
$running = 0
$stopped = 0

foreach ($s in $services) {
    if ($s.Status -eq 'Running') {
        $running++
    }
    elseif ($s.Status -eq 'Stopped') {
        $stopped++
    }
}

$summa = $running + $stopped
Write-Output "Darbojas: $running"
Write-Output "Apturēti: $stopped"
Write-Output "Summa: $summa"
