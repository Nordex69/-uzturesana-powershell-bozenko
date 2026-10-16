$disks = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType = 3"
$threshold = 50.0

foreach ($d in $disks) {
    $letter = $d.DeviceID
    $freeGb = [Math]::Round($d.FreeSpace / 1GB, 2)
    
    Write-Output "Disk $letter | Free space: $freeGb GB"
    
    if ($freeGb -lt $threshold) {
        Write-Warning "Warning! Disk $letter free space ($freeGb GB) is below the threshold ($threshold GB)."
    }
}
