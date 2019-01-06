# Script to check website availability
# Input file - websites2Check.json

$path = Get-Location
$inputfile = "websites2Check.json"

#Json input file processing
Try
    {
    $sitesJson = Get-Content "$path\$inputfile" -ErrorAction Stop | Out-String
    $sitesObject = ConvertFrom-Json –InputObject $sitesJson
    }
Catch 
    {
    Write-Output "$path\$inputfile is not found. `nPlease, put $inputfile into the script folder: $path."
    }


$ok = "is reachable"
$fail = "is unreachable"

# For loop to process each member of the array
For ( $i=0; $i -lt $sitesObject.websites2Check.Length; $i++)
{

$name = $sitesObject.websites2Check[$i].name
$url = $sitesObject.websites2Check[$i].url

# Web request processing
$HTTP_Request = [System.Net.WebRequest]::Create($url)

Try
    {
    $HTTP_Response = $HTTP_Request.GetResponse()
    $HTTP_Status = [int]$HTTP_Response.StatusCode
    Write-Output "$name $ok"
    $HTTP_Response.Close()
    }
Catch [system.exception]
    {
    Write-Output "$name $fail"
    }

}