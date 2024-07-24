Set-StrictMode -Version Latest
1 -eq 1 # equals
1 -ne 1 # not equals to
1 -ge 1 # greater than or equal
1 -gt 1 # greater than
2 -le 1 # less or equal
2 -lt 1

# array
@(1,2,3 )-contains 4

"Powershell" -like  "powershell"
"Powershell" -like  "power*"
"Powershell" -like  "powershel"

$filepath = "C:\Users\bened\Desktop\PowerShellBeginners\ames.txt"
test-path -path $filepath

$filepath = "C:\Users\bened\Desktop\PowerShellBeginners\names.txt"
test-path -path $filepath

$filepath = "C:\Users\bened\Desktop\PowerShellBeginners\ames.txt"
if(test-path -path $filepath){
    Write-Output "Does this run?"

}

$filepath = "C:\Users\bened\Desktop\PowerShellBeginners\names.txt"
if(test-path -path $filepath){
    Write-Output "Does this run?"

}


$filepath = "C:\Users\bened\Desktop\PowerShellBeginners\names.txt"
if(test-path -path $filepath){
    Get-Content -path $filepath

}else{
 Write-Output "The $filepath does ot exist"
}

$filepath = "C:\Users\bened\Desktop\PowerShellBeginners\names.txt"
if(test-path -path $filepath){
    $Data=Get-Content -path $filepath
    if($Data.Count -lt 5){
        Write-Output "The file has less than 5 names"
    }elseif($Data.Count -lt 10){
        Write-Output "The file has less than 10 names but at least 5 names"
    }else{
        Write-Output "The file has 10 or more names"
    }
    Write-Output "This is after if statement"

}else{
 Write-Output "The $filepath does ot exist"
}

###### SWITCH STATEMENTS 
$filepath = "C:\Users\bened\Desktop\PowerShellBeginners\names.txt"
$Data=Get-Content -path $filepath
$first = $Data[0]

if($first -eq "Mike"){
        Write-Output "My name is Mike"
}elseif($first -eq "Jim"){
        Write-Output "My name is Jim"
}elseif($first -eq "Steve"){
        Write-Output "My name is Steve"
}
else{
        Write-Output "I don't Know the name"
}


switch($first){
 "Mike"{
    Write-Output "My name is Mike"
 }
 "John"{
    Write-Output "My name is John"
 }
 "Jim"{
    Write-Output "My name is Jim"
 }
 default{
    Write-Output "I don't Know the name"
 }
}


## TO avoid print the two line we use break statement
switch($Data.Count){
 {0..4 -ccontains $Data.Count}{
    Write-Output "Between 0 and 4"
    #break
 }
 {3..7 -ccontains $Data.Count}{
    Write-Output "Between 3 and 7"
    #break

 }
 {5..10 -ccontains $Data.Count}{
    Write-Output "Between 5 and 10"
    #break
 }
 default{
    Write-Output "More than 10"
    #break
 }
}

#THREE TYPES OF FOR EACH LOOP IN POWERSHELL
$filepath = "C:\Users\bened\Desktop\PowerShellBeginners\names.txt"
$Data=Get-Content -path $filepath

$current=$Data[0]
Get-Content -Path "C:\Users\bened\Desktop\PowerShellBeginners\names\$current\config.txt"

Get-Content -Path "C:\Users\bened\Desktop\PowerShellBeginners\names\$($Data[0])\config.txt"
Get-Content -Path "C:\Users\bened\Desktop\PowerShellBeginners\names\$($Data[1])\config.txt"
Get-Content -Path "C:\Users\bened\Desktop\PowerShellBeginners\names\$($Data[2])\config.txt"
Get-Content -Path "C:\Users\bened\Desktop\PowerShellBeginners\names\$($Data[3])\config.txt"
Get-Content -Path "C:\Users\bened\Desktop\PowerShellBeginners\names\$($Data[4])\config.txt"
Get-Content -Path "C:\Users\bened\Desktop\PowerShellBeginners\names\$($Data[5])\config.txt"

foreach($name in $Data){
    Get-Content -Path "C:\Users\bened\Desktop\PowerShellBeginners\names\$name\config.txt"
}

$Data | ForEach-Object -process {
    Get-Content -Path "C:\Users\bened\Desktop\PowerShellBeginners\names\$_\config.txt"
}
# we use _ for eah object grab

$Data.ForEach({Get-Content -Path "C:\Users\bened\Desktop\PowerShellBeginners\names\$_\config.txt"})


## OTHER TYPES OF LOOPS
for($i=0;$i -lt 10;$i++){
 $i
}

$filepath = "C:\Users\bened\Desktop\PowerShellBeginners\names.txt"
$Data=Get-Content -path $filepath
for($i=0;$i -lt $Data.Length ;$i++){
 #$Data[$i]
 Get-Content -Path "C:\Users\bened\Desktop\PowerShellBeginners\names\$($Data[$i])\config.txt"
}

for($i=0;$i -lt $Data.Length ;$i++){
 $Data[$i]="Test i$"
}

# if you have a loop that will last forever you can add a break statement
# only works whe the condition is true
while((Get-Date).Minute -eq 38){
 Get-Date
 #break
}

do{
 Write-Output "Hello"
}while($false)


do{
    Write-Output "Hello"
}until($false)

#ERROR HANDLING
$ErrorActionPreference = "stop"

try{
    $filepath = "C:\Users\bened\names.txt"
    $Data=Get-Content -path $filepath #-ErrorAction Stop
    Write-Output "Should Still se this even if error"
    $Data.ForEach({
        $content = Get-Content -Path $_.fullname
        $content
    })
}catch{
    #$_.exception.message
    Write-Output "Error error"
    $Error[0].Exception.Message
}finnaly{
    Write-Output "will alwats run no matter what"
}