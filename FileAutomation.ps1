# Define the cutoff date (e.g., files older than 7 days)
$cutoffDate = (Get-Date).AddDays(-7)

Write-Host "Searching for files older than: $cutoffDate"

# Find files based on LastWriteTime and test moving/removing them with -WhatIf
Get-ChildItem -Path $PSScriptRoot -File | Where-Object { $_.LastWriteTime -lt $cutoffDate } | ForEach-Object {
    Write-Host "Found old file: $($_.Name)"
    # Example: Moving or removing safely with -WhatIf
    # Remove-Item $_.FullName -WhatIf
}