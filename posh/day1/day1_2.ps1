# Part 2

$sorted = (Import-Csv ./elf.csv | Sort-Object -Descending -Property sum)
$sum = 0

foreach($elf in $sorted[0,1,2] ){
    $sum += $elf.sum 
}

$sum