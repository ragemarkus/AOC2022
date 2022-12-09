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

    [int]$challenger_enriched = ($challenger | Foreach-Object {
            $_ -replace 'X', '1' `
                -replace 'Y', '2' `
                -replace 'Z', '3'
        } )

    switch ( "$opponent_enriched$challenger_enriched" ) {
        11 { [int]$result = 3 }
        22 { [int]$result = 3 }
        33 { [int]$result = 3 }
        12 { [int]$result = 6 }
        13 { [int]$result = 0 }
        21 { [int]$result = 0 }
        23 { [int]$result = 6 }
        31 { [int]$result = 6 }
        32 { [int]$result = 0 }
    }

    write-host $result+$challenger_enriched
    return $result+$challenger_enriched
}


$data = Import-Csv -Path ./rps.txt -Delimiter " "
$score = 0

foreach ($match in $data) {
    write-output "the match is : $match"
    write-output "the score is : $score"
    write-output "the result $(get-result -opponent $match.opponent -challenger $match.challenger)"
    $score += get-result -opponent $match.opponent -challenger $match.challenger
    write-output "the score is : $score"
}

write-output "the final score is : $score"

<#
0 = loss
3 = draw
6 = win
#>