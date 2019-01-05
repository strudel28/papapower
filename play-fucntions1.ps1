# hello world function
function hello-world
{
write-output "hello world"
}

# times function
function Get-TimesResult
{
param ( [int]$a, [int]$b)
$result = $a*$b
#write-output $result
return $result
}

# function for text return
function Parse-String
{
param($text)
return $text
}

# function for text length return
function Get-StringLength
{
param($text)
return $text.Length
}

# How to write String to array?
# Way 1: Dumb
function Write-StringToArrayDumb
{
param ( $text )
$n = $text.Length
$arr = @()
for( $i = 0; $i -lt $n; $i++)
    {
    $arr = $arr + $text.Chars($i)
    }
return $arr
}

# Way 2: Smart
function Write-StringToArraySmart
{
param ( $text )
$arr = $text.ToCharArray()
return $arr
}

# Find Unique Elements in the Array
function Get-ArrayUniqueCount
{
param ( $text )
$text = 
$arr = $text.ToCharArray()
$arr_unique = $arr | Sort | Get-Unique

$n = $arr.Length
$n_unique = $arr_unique.Length

$message = "text has "

for( $i = 0; $i -lt $n_unique; $i++)
    {
    $member =  $arr_unique[$i]
    if ( [Char]::IsLower($member))
        {
        $count = ($arr -like $member).Count
        if ($i -eq $n_unique-1) 
            { $message = $message + "4 '$member'"}
        else
            { $message = $message + "4 '$member', "}
        }
    }
write-output $message
}