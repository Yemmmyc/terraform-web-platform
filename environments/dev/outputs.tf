# Compute module outputs
output "compute_launch_template_id" {
  value = module.compute.launch_template_id
}

# Database module outputs
output "db_instance_id" {
  value = module.database.db_instance_id
}

output "db_endpoint" {
  value = module.database.db_endpoint
}

output "db_subnet_group_name" {
  value = module.database.db_subnet_group_name
}

