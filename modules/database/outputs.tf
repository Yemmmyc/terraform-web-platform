# RDS instance ID
output "db_instance_id" {
  description = "RDS instance ID"
  value       = aws_db_instance.main.id
}

# RDS endpoint
output "db_endpoint" {
  description = "RDS database endpoint"
  value       = aws_db_instance.main.endpoint
}

# DB Subnet Group
output "db_subnet_group_name" {
  description = "The DB Subnet Group name"
  value       = aws_db_subnet_group.this.name
}
