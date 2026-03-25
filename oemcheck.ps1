$OutputFile = "\\path\to\file.csv"

# Get licensing information from the local computer
$LicenseInfo = Get-WmiObject SoftwareLicensingService | 
               Select-Object PSComputerName, OA3xOriginalProductKey, OA3xOriginalProductKeyDescription

# Check if the CSV file exists
if (Test-Path $OutputFile) {
    # Append data to the existing CSV file
    $LicenseInfo | Export-Csv -Path $OutputFile -NoTypeInformation -Encoding UTF8 -Append
} else {
    # Create a new CSV file and write the data
    $LicenseInfo | Export-Csv -Path $OutputFile -NoTypeInformation -Encoding UTF8
}

Write-Host "Data appended to $OutputFile"
