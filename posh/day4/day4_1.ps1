function Get-AreaArray {
    param (
        $areas
    )
    $shifts = $areas.split(",")
    $shiftno = 0
    $map = @{}
    
    foreach ($shift in $shifts) {
        $shiftsequence = @()

        for ([int]$i = $shift.split("-")[0]; $i -le $shift.split("-")[1]; $i++) {
            $shiftsequence += $i
        }

        $map += @{
            $shiftno = $shiftsequence 
        }

        $shiftno ++
    }

    return $map
}

function Find-Overlap {
    param (
        $AreaArrayLeft,
        $AreaArrayRight
    )
    
    $res = @()
    $res = Compare-Object -ReferenceObject $AreaArrayLeft -DifferenceObject $AreaArrayRight -PassThru -ExcludeDifferent

    if ($res.length -ne $AreaArrayLeft.length) {
        return $false
    }
    else {
        return $true
    }

}

$overlap = @()

$data = Get-Content -Path ./input.txt

foreach ($area in $data) {
    $firstpass = $null
    $secondpass = $null

    $AreaArray = Get-AreaArray -areas $area
    $firstpass = Find-Overlap -AreaArrayRight $AreaArray[0] -AreaArrayLeft $AreaArray[1]
    $secondpass = Find-Overlap -AreaArrayRight $AreaArray[1] -AreaArrayLeft $AreaArray[0]

    if ($($firstpass -eq $true) -or $($secondpass -eq $true)) {
        $overlap += $area
    }
}

$overlap.count
