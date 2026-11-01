$data = import-csv -Path ""
foreach($row in $data){

$vm = $row.vmname
$os  = $row.osname
$username = ""
$script = @"
echo $password | sudo -S systemctl restart salt-minion >/dev/null
echo `$(systemctl is-active salt-minion)
"@

if($os -eq "Redhatlinux-8"){

$username = ""

}
elseif ($os -eq "RedHatlinux-9") {

$username = ""

}

try {
    $password = "passwd1"
    $result = Invoke-vmscript `
                -name $vm `
                -scripttext $script `
                -guestusername $username `
                -GuestPassword $password `
                -erroraction stop

$result | Export-Csv -Path /path/tooutput -Append
}

catch{
    $password = "passwd2"
    $result = Invoke-vmscript `
                -name $vm `
                -scripttext $script `
                -guestusername $username `
                -GuestPassword $password `

$result | Export-Csv -Path /path/tooutput -Append
}


}
