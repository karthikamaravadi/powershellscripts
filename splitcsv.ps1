$csvpath= C:\Users\$env:UserName\Desktop\epsplit\xxx.csv
$tagetfolder=C:\Users\$env:UserName\Desktop\\Desktop\epsplit
$totalrows=(Import-Csv $csvpath).count

$excel = New-Object -ComObject Excel.Application
$workbook = $excel.Workbooks.Open($csvpath)
$sheet = $workbook.ActiveSheet
$columnCount = $sheet.UsedRange.Columns.Count
"There are $columnCount columns in CSV file $path"

Start-Sleep -Seconds 1
Get-Process excel | Stop-Process -Force


# variable used to advance the number of the row from which the export starts
$startrow = 0 ;

# counter used in names of resulting CSV files
$counter = 1 ;

# setting the while loop to continue as long as the value of the $startrow variable is smaller than the number of rows in your source CSV file
while ($startrow -lt $totalrows)
{

# import of however many rows you want the resulting CSV to contain starting from the $startrow position and export of the imported content to a new file
Import-CSV $csvpath | select-object -skip $startrow -first 500 | Export-CSV C:\Users\$env:UserName\Desktop\epsplit\$($counter).csv -NoClobber;

# advancing the number of the row from which the export starts
$startrow += 500 ;

# incrementing the $counter variable
$counter++ ;

}