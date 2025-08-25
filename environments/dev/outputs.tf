output "vpc_id" {
  description = "The ID of the VPC created in this environment"
  value       = module.networking.vpc_id
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = module.networking.private_subnet_ids
}

output "db_endpoint" {
  description = "The endpoint of the RDS database instance"
  value       = module.database.db_endpoint
}

output "ec2_instance_ids" {
  description = "IDs of EC2 instances launched in this environment"
  value       = module.compute.instance_ids
}

output "ec2_public_ips" {
  description = "Public IP addresses of EC2 instances"
  value       = module.compute.instance_public_ips
}
