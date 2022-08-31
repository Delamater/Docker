$serverInstance = ".,1433"
$user = "sa"
$PWD = "yourStrong(!)Password"
$database = "UncontainedDb"
$file_bits_path = "E:\g\Delamater\C-Samples\ODBC_Pattern2\Resources\Sample-JPEG-Image-File-Download-scaled.jpg", "E:\g\Delamater\C-Samples\ODBC_Pattern2\Resources\Large-Sample-Image-download-for-Testing.jpg"


try {

    # Clear the table for a fresh start
    $truncate_table = "TRUNCATE TABLE SEEDPAY.ZCALLS"
    Invoke-Sqlcmd -ServerInstance $serverInstance -Username $user -Password $PWD -Database $database -Query $truncate_table
    
    # Let's insert blobs of different sizes based on the file array defined earlier
    $file_bits_path | ForEach-Object{

        Invoke-Sqlcmd -ServerInstance $serverInstance -Username $user -Password $PWD -Database $database -Query $insert -ErrorAction Stop -OutputSqlErrors $true
        Invoke-Sql -server $serverInstance -db $database -sqlCommand $insert
    }
}
catch {
    Write-Error $_.Exception
}
finally {
    [System.Data.SqlClient.SqlConnection]::ClearAllPools()
    Write-Host "All connections closed" -ForegroundColor DarkYellow
}

Write-Host "Procedure complete" -ForegroundColor DarkBlue