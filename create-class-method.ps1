Class Site
{
    [string] $name
    [string] $url

    [Site]TestMethod ()
    { 

    return $this

    }
}

# Google clas definition
$google = New-Object Site
$google.name = 'google'
$google.url = 'google.com'