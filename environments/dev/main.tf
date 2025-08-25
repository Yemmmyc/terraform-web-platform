provider "aws" {
  region = var.aws_region
}

# -----------------------------
# Load Networking Module
# -----------------------------
module "networking" {
  source               = "../../modules/networking"

  project              = var.project
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

# -----------------------------
# Load Compute Module (Dev: ELB/ASG disabled)
# -----------------------------
module "compute" {
  source          = "../../modules/compute"
  ami_id          = var.ami_id                  # Must be a valid dev AMI
  instance_type   = var.instance_type           # e.g., t2.micro
  vpc_id          = module.networking.vpc_id
  public_subnets  = module.networking.public_subnet_ids
  private_subnets = module.networking.private_subnet_ids
  project         = var.project
  enable_elb      = var.enable_elb  # ELB & ASG disabled for dev
  ssh_key_name    = var.ssh_key_name   # ✅ add this
  security_group_ids = [module.networking.app_sg_id] 
}

# -----------------------------
# Load Database Module
# -----------------------------
module "database" {
  source = "../../modules/database"

  project           = var.project
  db_identifier     = var.db_identifier
  db_name           = var.db_name
  db_user           = var.db_user
  db_password       = var.db_password
  instance_class    = var.instance_class
  private_subnets   = module.networking.private_subnet_ids
  security_group_ids = [module.networking.db_sg_id]
  vpc_id            = module.networking.vpc_id
  subnet_group_name = var.subnet_group_name

}

