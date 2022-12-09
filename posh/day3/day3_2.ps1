function split-package {
    param (
        $package
    )
    
    $len = $package.length

    $left = $package.Substring(0, $len / 2)
    $right = $package.substring($len / 2)

    return @{
        "left"  = $left;
        "right" = $right
    }
}

function find-item {
    param (
        $left,
        $right
    )
    
    $msg = $left.toCharArray()

    foreach ($item in $msg) {

        $ret1 = Select-String -InputObject $right[0] -Pattern $item -CaseSensitive -AllMatches
        if ($ret1) {
            $ret2 = Select-String -InputObject $right[1] -Pattern $item -CaseSensitive -AllMatches
            if ($ret2) {
                $ret2
                return $ret2.Matches.Value
            }
        }
        
    }
}

function find-value {
    param (
        $value
    )
    
    $alpha = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    $output = Select-String -InputObject $alpha -Pattern $value -AllMatches -CaseSensitive

    return $output.Matches.Index + 1 
}

function index-triple {
    param (
        $data
    )
    
    $list = @()

    for ($i = 0; $i -lt $data.Count; $i = $i + 3) {

        $list += @{
            "item" = @{
                "parent"   = $data[$i];
                "children" = $data[$($i + 1), $($i + 2)]
            };
        }
    }

    return $list

}

#$list[0].Values.parent
#$list[0].Values.children

$data = Get-Content -Path ./input.txt
$map = @()

$map += index-triple -data $data

$score = 0

foreach ($package in $map) {
    $item = find-item -left $package.item.parent -right $package.item.children 
    [int]$value = find-value -value $item

    $score += $value 

}

$score