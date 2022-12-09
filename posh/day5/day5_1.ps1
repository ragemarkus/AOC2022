# [V]         [T]         [J]        
# [Q]         [M] [P]     [Q]     [J]
# [W] [B]     [N] [Q]     [C]     [T]
# [M] [C]     [F] [N]     [G] [W] [G]
# [B] [W] [J] [H] [L]     [R] [B] [C]
# [N] [R] [R] [W] [W] [W] [D] [N] [F]
# [Z] [Z] [Q] [S] [F] [P] [B] [Q] [L]
# [C] [H] [F] [Z] [G] [L] [V] [Z] [H]
#  1   2   3   4   5   6   7   8   9 

$maps = @{
    1 = @("V", "Q", "W", "M", "B", "N", "Z", "C");
    2 = @("B", "C", "W", "R", "Z", "H")
    3 = @("J", "R", "Q", "F");
    4 = @("T", "M", "N", "F", "H", "W", "S", "Z");
    5 = @("P", "Q", "N", "L", "W", "F", "G");
    6 = @("W", "P", "L");
    7 = @("J", "Q", "C", "G", "R", "D", "B", "V");
    8 = @("W", "B", "N", "Q", "Z");
    9 = @("J", "T", "G", "C", "F", "L", "H")
}

$1 = New-Object System.Collections.Generic.Stack[String]
$2 = New-Object System.Collections.Generic.Stack[String]
$3 = New-Object System.Collections.Generic.Stack[String]
$4 = New-Object System.Collections.Generic.Stack[String]
$5 = New-Object System.Collections.Generic.Stack[String]
$6 = New-Object System.Collections.Generic.Stack[String]
$7 = New-Object System.Collections.Generic.Stack[String]
$8 = New-Object System.Collections.Generic.Stack[String]
$9 = New-Object System.Collections.Generic.Stack[String]


# create a function to create a stack for each map array.


function Add-Stack {
    param (
        $MapArray
    )
    
    foreach($Map in $MapArray){
        
    }
}