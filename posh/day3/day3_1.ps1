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
    $ret = $null
    $msg = $left.toCharArray()

    foreach ($item in $msg) {

        $ret = Select-String -InputObject $right -Pattern $item -CaseSensitive -AllMatches
        if ($ret) {
            return $ret.Matches.Value
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

$data = Get-Content -Path ./input.txt
$score = 0

foreach ($package in $data) {
    $letter = split-package -package $package
    $item = find-item -left $letter.left -right $letter.right 
    [int]$value = find-value -value $item

    $score += $value 

}

$score