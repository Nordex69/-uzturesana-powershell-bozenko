$limit = (Get-Date).AddHours(-48)
$errors = Get-EventLog -LogName System -EntryType Error -After $limit
$count = ($errors).Count
if ($null -eq $count) { $count = 0 }

Write-Output "Error count in the last 48 hours: $count"

if ($count -gt 0) {
    $topSource = $errors | Group-Object -Property Source | Sort-Object -Property Count -Descending | Select-Object -First 1
    Write-Output "Most frequent source: $($topSource.Name) (Count: $($topSource.Count))"
} else {
    Write-Output "No error records found."
}
