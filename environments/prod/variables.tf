variable "project" {}
variable "region" {}
variable "vpc_cidr" {}
variable "public_subnet_cidrs" { type = list(string) }
variable "private_subnet_cidrs" { type = list(string) }

variable "ami_id" {}
variable "instance_type" {}
variable "ssh_key_name" {}

variable "enable_elb" { type = bool }

# DB Variables
variable "db_name" {}
variable "db_user" {}
variable "db_password" {}
variable "instance_class" {}
variable "db_identifier" {}
variable "subnet_group_name" {}

