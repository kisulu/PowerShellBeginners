function Create-Configuration{
 [cmdletBinding()]
 param(
 [Parameter(Mandatory, ValueFromPipeline)]
 [String] $Name,
 [Parameter()]
 [ValidateSet("1","2")]
 [String] $Version ="1"
 
 )
 begin{
  Write-Output "Creating configuration file with name."
 }
 process{
  Write-Output "Creating configuration file with name: $Name at version: $Version"
 }
 end{
  Write-Output "Creating configuration file with name"
 }
}

$Names = @("Test1", "Test2", "Test3") # to usee this we add process block
Create-Configuration

Create-Configuration -Name "Test"

Create-Configuration -Name "Test" -Version "4"

$Names | Create-Configuration -Version "2"

$env:PSModulePath
Get-Module
Get-Module -ListAvailable

Import-Module -name WindowsUpdate 

Get-Command -Module WindowsUpdate

Get-WindowsUpdateLog

Import-Module -name WindowsUpdate -Force

Remove-Module -Name WindowsUpdate

Get-Module -Name firstmodule -ListAvailable

## python automatically imports module

Import-Module "C:\Users\bened\Desktop\PowerShellBeginners\firstmodule\firstmodule.psm1"

Remove-Configuration

Set-Configuration
