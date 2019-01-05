# This code allows to check execution policy
$policy = Get-ExecutionPolicy
if ( $policy = "Restricted" )
{ Write-Output "no to run script"
  Set-ExecutionPolicy unrestricted
}
else
{ Write-Output "ok to run script"}