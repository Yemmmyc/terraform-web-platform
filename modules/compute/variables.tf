variable "project" {}
variable "ami_id" {}
variable "instance_type" {}
variable "ssh_key_name" {}
variable "enable_elb" { type = bool }
variable "vpc_id" {}
variable "public_subnets" { type = list(string) }
variable "private_subnets" { type = list(string) }
variable "security_group_ids" { type = list(string) }
