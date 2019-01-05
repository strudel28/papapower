class Car{
    [int] $Wheels = 0
    [string] $Color = ""
}
$MyCar = New-Object Car
$MyCar.Wheels=4
$MyCar.Color = "Red"

$MyCar | ConvertTo-Json | out-file C:\Users\Maryia\ps-learn\MyRed.json