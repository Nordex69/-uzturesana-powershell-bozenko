$laiks = (Get-Date).AddHours(-48)
$kludas = Get-EventLog -LogName System -EntryType Error -After $laiks
$skaits = $kludas.Count

Write-Output "Kļūdu skaits: $skaits"

if ($skaits -gt 0) {
    $biezakais = $kludas | Group-Object -Property Source | Sort-Object -Property Count -Descending | Select-Object -First 1
    Write-Output "Visbiežākais avots: $($biezakais.Name) (reizes: $($biezakais.Count))"
}
