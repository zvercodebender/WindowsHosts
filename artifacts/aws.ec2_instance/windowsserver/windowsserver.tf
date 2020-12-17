##########################################################################
#
# variables
variable "my-sg" {
  type = list(string)
}
variable "my-ami" {
  type = string
}

##########################################################################
#  windowsserver
#
resource "aws_instance" "windowsserver" {
  ami                    = var.my-ami
  instance_type          = "t2.large"
  key_name               = "rbroker-us1"
  vpc_security_group_ids = var.my-sg

  associate_public_ip_address = true
    tags = {
      Name = "rrb-windowsserver"
      Terraform   = "true"
      Environment = "dev"
    }

  user_data = <<EOF
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
EOF
}
#######################################################
#  windowsserver Variables
output "public_ip" {
  description = "Public IP addresses of EC2 instances"
  value       = aws_instance.windowsserver.public_ip
}

output "private_ip" {
  description = "Private IP addresses of EC2 instances"
  value       = aws_instance.windowsserver.private_ip
}

output "public_dns" {
  description = "Public IP addresses of EC2 instances"
  value       = aws_instance.windowsserver.public_dns
}

output "private_dns" {
  description = "Private IP addresses of EC2 instances"
  value       = aws_instance.windowsserver.private_dns
}
