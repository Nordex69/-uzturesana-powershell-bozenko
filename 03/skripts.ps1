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

$sum = $running + $stopped
Write-Output "Running services: $running"
Write-Output "Stopped services: $stopped"
Write-Output "Total sum: $sum"
