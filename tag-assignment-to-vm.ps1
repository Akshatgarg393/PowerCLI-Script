#Tag assignment to all the vm with details in csv

Connect-VIServer -server <fqdn or ip> -user <username> -password <password>


$completedata = (Import-Csv "Path\to\csv")

foreach ( Srow in $completedata){

$vm = Get-VM -Name $row.Name

Write-Host "$($vm)"


$tag1 = Get-Tag -Category "Application Name" -Name Srow.ApplicationName

Stag2 = Get-Tag -Category "Department Name" -Name Srow.DepartmentName

$tag3 = Get-Tag -Category "Application Type" -Name Srow.ApplicationType

$tag4 = Get-Tag -Category "Tier" -Name Srow.Tier

$tag5 = Get-Tag -Category "Location" -Name Srow.Location

Stag6 - Get-Tag -Category "Vertical" -Name Srow.Vertical

$tag7 = Get-Tag -Category "Criticality" -Name Srow.Criticality

$tag8 = Get-Tag -Category "Environment" -Name Srow.Environment



New-TagAssignment -Entity Svm -Tag $tag1

New-TagAssignment -Entity $vm -Tag Stag2

New-TagAssignment -Entity $vm -Tag $tag3

New-TagAssignment -Entity $vm -Tag $tag4

New-TagAssignment -Entity $vm -Tag Stag5

New-TagAssignment -Entity $vm -Tag Stag6

New-TagAssignment -Entity $vm -Tag $tag7

New-TagAssignment -Entity $vm -Tag Stag&

}
