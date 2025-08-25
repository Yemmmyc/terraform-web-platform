# EC2 Launch Template ID
output "launch_template_id" {
  description = "EC2 Launch Template ID"
  value       = aws_launch_template.app.id
}
