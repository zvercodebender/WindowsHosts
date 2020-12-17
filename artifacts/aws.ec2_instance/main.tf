# Terraform configuration

provider "aws" {
  region = var.aws_region
  access_key = "{{AWS_ACCESS_KEY}}"
  secret_key = "{{AWS_SECRET_KEY}}"
}

##########################################################################
#  WindowsServer
#
module "windowsserver" {
    source          = "./windowsserver"
    my-ami          = var.ami
    my-sg           = var.my-sg
}
