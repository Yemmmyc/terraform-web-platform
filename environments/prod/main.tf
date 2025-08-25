terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# -----------------------------
# Networking Module
# -----------------------------
module "networking" {
  source              = "../../modules/networking"
  project             = var.project
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

# -----------------------------
# Database Module
# -----------------------------
module "database" {
  source            = "../../modules/database"
  project           = var.project
  db_name           = var.db_name
  db_user           = var.db_user
  db_password       = var.db_password
  vpc_id            = module.networking.vpc_id         # ✅ Pass VPC ID here
  instance_class    = var.instance_class
  db_identifier     = var.db_identifier
  private_subnets   = module.networking.private_subnet_ids
  subnet_group_name = "${var.project}-db-subnet-group"
}

# -----------------------------
# Compute Module
# -----------------------------
module "compute" {
  source            = "../../modules/compute"
  project           = var.project
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  ssh_key_name      = var.ssh_key_name
  enable_elb        = var.enable_elb
  vpc_id            = module.networking.vpc_id
  public_subnets    = module.networking.public_subnet_ids
  private_subnets   = module.networking.private_subnet_ids
  security_group_ids = [
    module.networking.app_sg_id
  ]
}
