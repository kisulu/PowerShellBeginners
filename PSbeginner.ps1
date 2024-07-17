Set-StrictMode -Version latest # Deosnt allow the declarion of empty var/null
$myVar # example

$GivenName = "Benedict"
$VALUE1=1
$VALUE3=3
$VALUE10=10
$VALUE3+$VALUE1
$result=$VALUE1+$VALUE3


Set-StrictMode -Off
$GivenName.Length

$null # Built in var

$DoubleValue = 3.2
$DoubleValue.GetType()

$Bool = $True
$Bool.getType()

$Today = Get-Date
$Today.getType()

#arrays
$names = @("Ben","Pius","John")
$names.getType()
$names.IsFixedSize

$names[0]

$names=$names+"Glenn"
$names
$names[3]

$names+="Timy"
$names
$names[4]


$names=$names -ne "Glenn" #removing an item from an array

$names

################################################ arraylists with fixed size=false
$nameslist = [System.Collections.arraylist]@("Ben","Pius","John")
$nameslist.GetType()
$nameslist.IsFixedSize
$nameslist
$nameslist[0]

###Adding items in arraylist
$nameslist.Add("Mike") ## returns the index where the item has been added

## to avoid this printing of  the index we set it to null
$null=$nameslist.Add("Tyson")
$nameslist

## to remove an item 
$nameslist.remove("Ben")
$nameslist

## remove using position
$nameslist.RemoveAt(1)
$nameslist

$names = @() #array
$nameslist = [System.Collections.arraylist]@()## arraylist
Measure-Command -Expression (@)
Measure-Command -Expression ()

## HashTable and customeobject part of data structure
## HashTables is like dictionaries in other programing languages key:value pair

$user=@{
 JustinB="Justin Bieber"
 SteveP="Steven Pickles"
 BenedictO="Benedict Ooko"

}
$user
$user.GetType()
$user.Keys
$user.values

$user["JustinB"] ## grabing values use keys no indexing or
$user.JustinB

## Adding and removing items from hashtables
$user.Add("JohnM",  "John Mike")
$user # or
$user["TestU"] = "Test Users"
$user

## Removing Items
$user.ContainsKey("Testing")

$user.ContainsKey("SteveP")

$user.Remove("SteveP")
$user

## Updating
$user["JohnM"]="John Mwangi"
$user

## last Data Structure used more in advanced scrpting (Custom Object)
## Created in Two ways
## Useful when automating active directory
$Dog= New-Object -TypeName PSCustomObject
$Dog
Add-Member -InputObject $Dog -MemberType NoteProperty -Name "name" -Value "Penny"
Add-Member -InputObject $Dog -MemberType NoteProperty -Name "breed" -Value "Pug"
$Dog
Get-Member -InputObject $Dog

## second way of creating  custom objects
$Cat =[PSCustomObject]@{Name="Franky"; Breed="Pug"}
$Cat

## Piping commandlets /Combining what we have learnt so far
Set-StrictMode -Version latest
Get-Service ## all services running on my pc
Get-Service -Name XboxNetApiSvc

$name = "XboxNetApiSvc"
Get-Service -Name $name

$name = "WinDefend"
Get-Service -Name $name
Stop-Service -Name $name

Get-Service -Name $name | Start-Service

$serviceslist = [System.Collections.arraylist]@("W32Time","WaaSMedicSvc","VSS")
## Start-Service VSS
$serviceslist | Get-Service | Start-Service
$serviceslist | Get-Service | Stop-Service
$serviceslist | Get-Service

Get-Help -Name Get-Service -Full

$env:COMPUTERNAME

$ServiceObj= New-Object -TypeName PSCustomObject

Add-Member -InputObject $ServiceObj -MemberType NoteProperty -Name "Name" -Value "W32Time"
Add-Member -InputObject $ServiceObj -MemberType NoteProperty -Name "COMPUTERNAME" -Value "DESKTOP-BEN"

$ServiceObj | Get-Service