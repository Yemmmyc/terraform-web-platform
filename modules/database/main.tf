# DB Subnet Group
resource "aws_db_subnet_group" "this" {
  name       = "${var.project}-db-subnet-group"
  subnet_ids = var.private_subnets
  tags = {
    Name = "${var.project}-db-subnet-group"
  }
}

# RDS Instance
resource "aws_db_instance" "main" {
  identifier             = var.db_identifier
  engine                 = "mysql"
  engine_version         = "8.0.42"   #  ✅ use a supported version
  instance_class         = var.instance_class
  username               = var.db_user
  password               = var.db_password
  db_name                = var.db_name
  db_subnet_group_name   = var.subnet_group_name
  vpc_security_group_ids = var.security_group_ids

  skip_final_snapshot    = true  # Dev-friendly
  publicly_accessible    = false
  multi_az               = false
  allocated_storage      = 20

  tags = {
    Name = "${var.project}-db"
  }
}