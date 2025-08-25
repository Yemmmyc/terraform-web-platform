# Terraform Web Platform

## Overview

The **Terraform Web Platform** project automates the provisioning of a web application infrastructure on **AWS**. It supports **dev** and **prod** environments and includes:

* **VPC, subnets, and security groups**
* **RDS database with subnet groups**
* **EC2 instances with launch templates and Auto Scaling**
* **Optional Load Balancer (ELB/ALB)**
* **Outputs for monitoring and integration**

This project demonstrates a modular, reusable Terraform architecture and a safe version control strategy.

---

## Project Structure

```
terraform-web-platform/
├── modules/
│   ├── compute/             # EC2, Launch Template, Auto Scaling
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── networking/          # VPC, subnets, security groups, RDS subnet groups
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   └── database/            # RDS instance
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   └── terraform.tfvars
│   └── prod/
│       ├── main.tf
│       └── terraform.tfvars
├── .gitignore
├── README.md
└── outputs.tf
```

---

## Prerequisites

* [Terraform](https://www.terraform.io/downloads.html) >= 1.5
* [AWS CLI](https://aws.amazon.com/cli/) configured with access keys
* AWS account with permissions for EC2, VPC, RDS, and IAM
* Optional: Git for version control

---

## Setup Instructions

### 1. Clone the Repository

```bash
git clone <your-repo-url>
cd terraform-web-platform
```

### 2. Initialize Terraform

For a specific environment (e.g., prod):

```bash
cd environments/prod
terraform init
```

This initializes modules and downloads providers.

### 3. Validate Configuration

```bash
terraform validate
```

Ensure your Terraform files are correct.

### 4. Plan the Deployment

```bash
terraform plan -var-file=terraform.tfvars
```

Check the resources that will be created, modified, or destroyed.

### 5. Apply the Configuration

```bash
terraform apply -var-file=terraform.tfvars
```

Type `yes` to confirm. Terraform will create the infrastructure.

---

## Outputs

After deployment, Terraform exposes important outputs:

* `db_instance_id`: RDS instance ID
* `db_endpoint`: RDS endpoint for connecting your database
* `db_subnet_group_name`: Name of the database subnet group
* `launch_template_id`: EC2 launch template ID

These outputs can be used in scripts, monitoring, or for connecting applications.

---

## Monitoring & Testing

* Use **AWS CloudWatch** to monitor EC2, RDS, and Auto Scaling metrics.
* Test Auto Scaling by simulating load on EC2 instances.
* Optional: Enable alarms for CPU utilization, RDS storage, or network traffic.

---

## Git Version Control Strategy

1. **Ignore sensitive files** in `.gitignore`:

```gitignore
*.tfstate
*.tfstate.backup
*.tfvars
.terraform/
```

2. **Commit modular code and outputs** only:

```bash
git add modules/ environments/ README.md outputs.tf
git commit -m "Add Terraform modules and environment configs"
git push origin main
```

3. **Separate branches for environments** (optional):

* `dev` branch for testing and development
* `main` or `prod` branch for production

4. **Keep outputs tracked** but do **not commit sensitive secrets** like passwords or AWS keys.

---

## Cleaning Up

To destroy all resources for an environment:

```bash
cd environments/prod
terraform destroy -var-file=terraform.tfvars
```

Confirm with `yes` to prevent orphaned resources and unexpected costs.

---

## Best Practices

* Always review `terraform plan` before `apply`.
* Never commit `.tfstate` or `.tfvars` with secrets.
* Use Terraform modules for reusable, organized code.
* Enable version control to track changes safely.

---

## References

* [Terraform Documentation](https://www.terraform.io/docs)
* [AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
* [AWS CLI](https://aws.amazon.com/cli/)

---

**Author:** Oluwayemisi Okunrounmu

**Project:** Terraform Web Platform

**Date:** 2025-08-25
