function mix($s1, $s2) {
    $alphabase="abcdefghijklmnopqrstuvwxyz"
    $result = @()
    for ($i = 0; $i -lt $alphabase.Length; $i++) {
        $c = $alphabase[$i]
        $nb_s1 = [Regex]::Replace($s1, "[^$c]+", "")
        $nb_s2 = [Regex]::Replace($s2, "[^$c]+", "")
        $lg_s1 = $nb_s1.Length
        $lg_s2 = $nb_s2.Length
        if (($lg_s1 -gt 1) -or ($lg_s2 -gt 1)) 
        {
            if ($lg_s1 -eq $lg_s2) 
            { 
                $result += @("E:" + $nb_s1)
            }
            if ($lg_s1 -gt $lg_s2) 
            {
                $result += @("1:" + $nb_s1)
            }
            if ($lg_s1 -lt $lg_s2) 
            { 
                $result += @("2:" + $nb_s2)
            }
        }
    }
    $res = $result | Sort-Object -Property {-$_.Length}, {$_}
    $res -join "/"
}