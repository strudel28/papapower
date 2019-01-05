
$path = Get-Location
$inputfile = "$path\websites2Check.json"

$sitesJson = Get-Content $inputfile | Out-String	
$sitesObject = ConvertFrom-Json –InputObject $sitesJson
#$sitesObject.websites2Check

$ok = "is reachable"
$fail = "is unreachable"

For ( $i=0; $i -lt $sitesObject.websites2Check.Length; $i++)
{

$name = $sitesObject.websites2Check[$i].name
$url = $sitesObject.websites2Check[$i].url

$HTTP_Request = [System.Net.WebRequest]::Create($url)

Try
    {
    $HTTP_Response = $HTTP_Request.GetResponse()
    $HTTP_Status = [int]$HTTP_Response.StatusCode
    Write-host $name, $ok
    $HTTP_Response.Close()
    }
Catch [system.exception]
    {
    Write-host $name, $fail
    }

}