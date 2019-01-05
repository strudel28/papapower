Class Site
{
    [string] $name
    [string] $url
}

# Google clas definition
$google = New-Object Site
$google.name = 'google'
$google.url = 'google.com'
# FIles definition
$path = 'd:\ps\'
$input_file = ‘google_ping.txt’
$output_file = ‘google_ping_res.txt’
$regex_loss = ‘\((.*)\)’
#Messages
$ok = " is reachable"
$fail = " is unreachable"

cd $path
rm $input_file
ping $google.url > $input_file
rm $output_file
'google.com' | add-content $output_file
$var = select-string -Path $input_file -Pattern $regex_loss -AllMatches | % { $_.Matches } | % { $_.Value }
if ($var.Length -eq 9)
{write-host $google.name, $ok }