function get-result {
    param (
        $opponent,
        $challenger
    )

    [int]$opponent_enriched = ($opponent | Foreach-Object {
            $_ -replace 'A', '1' `
                -replace 'B', '2' `
                -replace 'C', '3'
        } )

    [int]$outcome = ($challenger | Foreach-Object {
            $_ -replace 'X', '0' `
                -replace 'Y', '3' `
                -replace 'Z', '6'
        } )

    switch ( "$opponent_enriched$outcome" ) {
        13 { [int]$shape = 1 } #
        23 { [int]$shape = 2 } #
        33 { [int]$shape = 3 } #
        16 { [int]$shape = 2 } #
        10 { [int]$shape = 3 } #
        20 { [int]$shape = 1 } #
        26 { [int]$shape = 3 } #
        36 { [int]$shape = 1 } #
        30 { [int]$shape = 2 } #
    }

    write-host $shape+$outcome
    return $shape+$outcome
}


$data = Import-Csv -Path ./rps.txt -Delimiter " "
$score = 0

foreach ($match in $data) {
    write-output "the match is : $match"
    write-output "the score is : $score"
    $score += get-result -opponent $match.opponent -challenger $match.challenger
    write-output "the score is : $score"
}

write-output "the final score is : $score"

<#
0 = loss
3 = draw
6 = win
#>