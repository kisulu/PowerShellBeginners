HostName
$testblock = {write-host "this is a scriptblock!"}

& $testblock

Invoke-Command -ComputerName DESKTOP-BEN  -filepath c:\gethostname.ps1
 
Invoke-Commmand -ComputerName DESKTOP-BEN -scriptBlock {write-host "this is running on $(hostname)"}

$Somevar = "This is a local variable"

## THIS WILL NOT WORK
Invoke-Command -ComputerName DESKTOP-BEN -ScriptBlock {
 write-host "This is running on $(hostname) and $($Somevar)"
}

## Instead we do this 
Invoke-Command -ComputerName DESKTOP-BEN -ScriptBlock {
 write-host "This is running on $(hostname) and $($args[0])"
} -ArgumentList $Somevar

##or
Invoke-Command -ComputerName DESKTOP-BEN -ScriptBlock {
 write-host "This is running on $(hostname) and $($using:Somevar)"
}

## This will work
Invoke-Command -ComputerName DESKTOP-BEN -ScriptBlock {
 $test = "This is running on $(hostname) and $($using:Somevar)"
 Write-Host $test
}

## ## This will not work since it is another ssession
Invoke-Command -ComputerName DESKTOP-BEN -ScriptBlock {
 Write-Host $test
}

## Instead
New-PSSession -ComputerName  DESKTOP-RQIHH8C
New-PSSession -ComputerName  DESKTOP-BEN

$Session = get-PSSession -computename DESKTOP-BEN

$Session

Invoke-Command -Session $Session -ScriptBlock {
 $test = "This is running on $(hostname) and $($using:Somevar)"
}

Invoke-Command -Session $Session -ScriptBlock {
 Write-Host $test
}

Disconnect-PSSession -Session $Session

Get-PSSession

Connect-PSSession -Session $Session

Get-PSSession | Disconnect-PSSession | Remove-PSSession