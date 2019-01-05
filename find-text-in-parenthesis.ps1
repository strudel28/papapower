#$input_path = ‘d:\ps\ip_addresses.txt’
#$output_file = ‘d:\ps\extracted_text.txt’
# $regex = ‘\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b’
#select-string -Path $input_path -Pattern $regex -AllMatches | % { $_.Matches } | % { $_.Value } > $output_file
$path = 'd:\ps\'
$input_file = ‘google_ping.txt’
$output_file = ‘google_ping_res.txt’
$regex_loss = ‘\((.*)\)’
cd $path
rm $input_file
ping google.com > $input_file
rm $output_file
'google.com' | add-content $output_file
select-string -Path $input_file -Pattern $regex_loss -AllMatches | % { $_.Matches } | % { $_.Value } | add-content $output_file