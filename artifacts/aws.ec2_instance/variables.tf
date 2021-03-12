# Input variable definitions


variable "project" {
  description = "Project Name"
  type        = string
  default     = "ProjectName"
}

variable "ami" {
  description  = "AMI to use for servers"
  type         = string
  default      = "ami-0d5b55fd8cd8738f5"
}

variable "aws_region" {
  description  = "AWS Region"
  type         = string
  default      = "us-east-2"
}

variable "my-sg" {
  type    = list(string)
  default = ["sg-0d6c41f3ecf0fb5c2"]
}
