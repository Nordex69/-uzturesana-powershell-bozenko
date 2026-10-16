$time1 = Measure-Command -Expression { Get-Service -Name "Spooler" }
$time2 = Measure-Command -Expression { Get-CimInstance -ClassName Win32_Service -Filter "Name = 'Spooler'" }

Write-Output "Method 1 (Get-Service): $($time1.TotalMilliseconds) ms"
Write-Output "Method 2 (Get-CimInstance): $($time2.TotalMilliseconds) ms"
