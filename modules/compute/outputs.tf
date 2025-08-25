# EC2 Launch Template ID
output "launch_template_id" {
  description = "EC2 Launch Template ID"
  value       = aws_launch_template.app.id
}

# ALB (optional)
output "alb_arn" {
  description = "Application Load Balancer ARN"
  value       = var.enable_elb && length(aws_lb.app) > 0 ? aws_lb.app[0].arn : null
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS name"
  value       = var.enable_elb && length(aws_lb.app) > 0 ? aws_lb.app[0].dns_name : null
}

# Auto Scaling Group name
output "asg_name" {
  description = "Auto Scaling Group name"
  value       = var.enable_elb && length(aws_autoscaling_group.app) > 0 ? aws_autoscaling_group.app[0].name : null
}
