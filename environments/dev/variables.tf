variable "project" {
  description = "Name of the project"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
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

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "security_group_ids" {
  description = "List of security groups to attach to DB"
  type        = list(string)
  default     = []
}

variable "ssh_key_name" {
  description = "EC2 key pair name for SSH access"
  type        = string
}

variable "my_ip" {
  description = "Your public IP for security groups"
  type        = string
}

variable "enable_elb" {
  description = "Whether to enable ELB for the environment"
  type        = bool
  default     = false
}
variable "db_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
}

variable "instance_class" {
  description = "RDS instance class (e.g., db.t3.micro)"
  type        = string
}
