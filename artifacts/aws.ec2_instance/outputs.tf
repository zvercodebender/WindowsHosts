# Output variable definitions
#######################################################
#  windowsserver Variables
output "windowsserver_public_ip" {
  description = "Public IP addresses of EC2 instances"
  value       = module.windowsserver.public_ip
}

output "windowsserver_private_ip" {
  description = "Private IP addresses of EC2 instances"
  value       = module.windowsserver.private_ip
}

output "windowsserver_public_dns" {
  description = "Public IP addresses of EC2 instances"
  value       = module.windowsserver.public_dns
}

output "windowsserver_private_dns" {
  description = "Private IP addresses of EC2 instances"
  value       = module.windowsserver.private_dns
}

output "windowsserver_HOST" {
  description = "Private IP addresses of EC2 instances"
  value       = module.windowsserver.private_ip
}

#######################################################

output "project" {
  value       = var.project
}
