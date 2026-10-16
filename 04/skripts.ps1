$servisi = Get-CimInstance -ClassName Win32_Service | Where-Object { $_.StartMode -eq 'Auto' -and $_.State -eq 'Stopped' }

if ($null -eq $servisi) {
    Write-Output "Skaits: 0"
    Write-Output "Nav atrasts neviens serviss."
} else {
    Write-Output "Skaits: $($servisi.Count)"
    foreach ($s in $servisi) {
        Start-Service -Name $s.Name -WhatIf
    }
}
