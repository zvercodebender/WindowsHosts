<powershell>
winrm quickconfig -q
winrm set winrm/config/service/Auth '@{ Basic="true" }'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'

Set-NetFirewallRule FPS-SMB-In-TCP -Enabled True
Get-NetFirewallrule WINRM-HTTP-In-TCP | Get-NetFirewallAddressFilter | Set-NetFirewallAddressFilter -RemoteAddress Any
Get-NetFirewallrule WINRM-HTTP-In-TCP-PUBLIC | Get-NetFirewallAddressFilter | Set-NetFirewallAddressFilter -RemoteAddress Any

$myPassword = "Passw0rd!"
$myPasswordEnc = ConvertTo-SecureString -String $myPassword -AsPlainText -Force
New-LocalUser -Name root -Description "Root User" -Password $myPasswordEnc –Verbose
Set-LocalUser -Name root –PasswordNeverExpires $False
Add-LocalGroupMember -Group "Administrators" -Member "root"
Add-LocalGroupMember -Group "Remote Management Users" -Member "root"
Install-WindowsFeature -name Web-Server -IncludeManagementTools
</powershell>
