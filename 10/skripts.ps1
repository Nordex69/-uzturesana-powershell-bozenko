$processes = (Get-Process).Count
$services = Get-Service
$running = 0
$stopped = 0

foreach ($s in $services) {
    if ($s.Status -eq 'Running') { $running++ }
    elseif ($s.Status -eq 'Stopped') { $stopped++ }
}

$errors = (Get-EventLog -LogName System -EntryType Error -After (Get-Date).AddHours(-48)).Count
if ($null -eq $errors) { $errors = 0 }

$diskC = [Math]::Round((Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DeviceID = 'C:'").FreeSpace / 1GB, 2)

Write-Output "Process count: $processes"
Write-Output "Running services: $running"
Write-Output "Stopped services: $stopped"
Write-Output "Errors (48h): $errors"
Write-Output "C: Disk free space: $diskC GB"
