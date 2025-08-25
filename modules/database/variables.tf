variable "project" {
  description = "Project name for tagging"
  type        = string
}

variable "db_identifier" {
  description = "RDS instance identifier"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_user" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "instance_class" {
  description = "RDS instance type"
  type        = string
}

variable "subnet_group_name" {
  description = "RDS DB subnet group name"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs for RDS"
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "List of private subnet IDs for the database"
  type        = list(string)
  default     = []  # Optional, avoids prompts
}
variable "vpc_id" {
  description = "The VPC ID where the database should be deployed"
  type        = string
}
