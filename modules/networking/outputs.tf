# terraform-web-platform/modules/networking/outputs.tf

output "vpc_id" {
  description = "The VPC ID"
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
   description = "List of private subnet IDs" 
  value = aws_subnet.private[*].id
}

output "db_sg_id" {
    description = "Security group ID for RDS"
  value = aws_security_group.db_sg.id
}

output "db_subnet_group" {
    description = "DB Subnet Group name"
  value = aws_db_subnet_group.db_subnet_group.name
}

# ✅ Add this for dynamic security group list
output "all_security_group_ids" {
    description = "All security group IDs for reference"
  value = [aws_security_group.db_sg.id]
}
output "app_sg_id" {
  description = "App Security Group ID"
  value       = aws_security_group.app_sg.id
}

