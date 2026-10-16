Get-Process | ForEach-Object {
    try {
        $owner = $_.GetOwner()
        Write-Output "Process: $($_.Name) | User: $($owner.User)"
    }
    catch {
        Write-Output "Process: $($_.Name) | User: Access Denied (Administrator rights required)"
    }
}
