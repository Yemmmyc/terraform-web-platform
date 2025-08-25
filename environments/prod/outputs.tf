# environments/prod/outputs.tf

# Compute module outputs
output "launch_template_id" {
  description = "EC2 Launch Template ID"
  value       = module.compute.launch_template_id
}

output "alb_arn" {
  description = "Application Load Balancer ARN (null if disabled)"
  value       = module.compute.alb_arn
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS name (null if disabled)"
  value       = module.compute.alb_dns_name
}

output "asg_name" {
  description = "Auto Scaling Group name"
  value       = module.compute.asg_name
}

# Database module outputs
output "db_instance_id" {
  description = "RDS database instance ID"
  value       = module.database.db_instance_id
}

output "db_endpoint" {
  description = "RDS database endpoint"
  value       = module.database.db_endpoint
}

output "db_subnet_group_name" {
  description = "RDS DB Subnet Group name"
  value       = module.database.db_subnet_group_name
}
