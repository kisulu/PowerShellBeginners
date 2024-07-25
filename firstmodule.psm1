function Get-Configuration{
 [cmdletBinding()]
 param()
  Write-Output "Get"
}

function Set-Configuration{
 [cmdletBinding()]
 param()
 Write-Output "Set"
}

function Remove-Configuration{
 [cmdletBinding()]
 param()
 Write-Output "Remove"
}

## Microsoft recommends to ccreate module manifest - help -author -path
New-ModuleManifest -Path "C:\Users\bened\Desktop\PowerShellBeginners\firstmodule.psd1" -Author "Benedict Ooko" -Description "This is my first powershell module" -RootModule firstmodule.psm1