# -----------------------------
# Launch Template (used by ASG)
# -----------------------------
resource "aws_launch_template" "app" {
  name_prefix   = "${var.project}-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.ssh_key_name
  vpc_security_group_ids = var.security_group_ids

  user_data = base64encode(<<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "Hello from Terraform Prod EC2 and Auto-Scaling!" > /var/www/html/index.html
              EOF
  )

  tags = {
    Name = "${var.project}-ec2"
  }
}

# -----------------------------
# Optional Load Balancer
# -----------------------------
resource "aws_lb" "app" {
  count              = var.enable_elb ? 1 : 0
  name               = "${var.project}-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.public_subnets
  security_groups    = [] # attach if needed
  tags               = { Name = "${var.project}-alb" }
}

resource "aws_lb_target_group" "app" {
  count    = var.enable_elb ? 1 : 0
  name     = "${var.project}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-399"
  }

  tags = { Name = "${var.project}-tg" }
}

resource "aws_lb_listener" "http" {
  count             = var.enable_elb ? 1 : 0
  load_balancer_arn = aws_lb.app[0].arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app[0].arn
  }
}

# -----------------------------
# Auto Scaling Group
# -----------------------------
resource "aws_autoscaling_group" "app" {
  count = var.enable_elb ? 1 : 0

  launch_template {
    id = aws_launch_template.app.id
  }

  vpc_zone_identifier = var.private_subnets
  min_size            = 1
  max_size            = 3
  desired_capacity    = 1
  target_group_arns   = var.enable_elb ? [aws_lb_target_group.app[0].arn] : []

  tag {
    key                 = "Name"
    value               = "${var.project}-asg"
    propagate_at_launch = true
  }
}
