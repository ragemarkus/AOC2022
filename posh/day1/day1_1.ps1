$data = Get-Content -Path ./data.txt
$elf = 0
$sum = 0

Out-File -InputObject "sum,elf" -FilePath ./elf.csv -Append

foreach($line in $data){
    Write-Output $line
    if ($line -ne "") {
        $sum += $line
    }else{
        Write-Output "blank"
        Out-File -InputObject "$sum,$elf" -FilePath ./elf.csv -Append
        $sum = 0
        $elf++
    }

}

Import-Csv ./elf.csv | Sort-Object -Descending -Property sum


# Part 2

$sorted = (Import-Csv ./elf.csv | Sort-Object -Descending -Property sum)
$sum = 0

foreach($elf in $sorted[0,1,2] ){
    $sum += $elf 
}

$sum