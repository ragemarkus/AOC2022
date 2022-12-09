# OPPONENT
# A = 1
# B = 2
# C = 3

# CHALLENGER
# X = 1
# Y = 2
# Z = 3

$data = Get-Content -Path ./rps.txt


$data_enriched = ($data | Foreach-Object {
    $_ -replace 'A', '1' `
       -replace 'B', '2' `
       -replace 'C', '3' `
       -replace 'X', '1' `
       -replace 'Y', '2' `
       -replace 'Z', '3'
    } )

Out-File -InputObject "Opponent,Challenger" -FilePath ./rps.csv -Append
Out-File -InputObject $data_enriched.replace(" ", ",") -FilePath ./rps.csv -Append

