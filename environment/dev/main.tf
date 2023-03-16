terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


module "networking" {
  source      = "../../modules/network"
  vpc_cidr_block                = "192.168.0.0/16"
  max_subnets                   = 4
  public_cidrs                  = ["192.168.1.0/24", "192.168.2.0/24"]
  private_cidrs                 = ["192.168.3.0/24", "192.168.4.0/24"]
  azs                           = ["us-east-1a",   "us-east-1b"]
  instance_type                 = "t2.micro"
  key_name                      = "prod-bastion-host-key"
  associate_public_ip_address   = "true"
  env                           = "dev"
}



module "aws_db" {
  source  = "../../modules/aws_rds"

  identifier                          = var.identifier

  engine                              = var.engine
  engine_version                      = var.engine_version
  instance_class                      = var.instance_class
  allocated_storage                   = var.allocated_storage
  max_allocated_storage               = var.max_allocated_storage
  username                            = var.username
  port                                = var.port
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  vpc_security_group_ids              = var.vpc_security_group_id
  db_subnet_group_name                = var.aws_db_subnet_group.db_sg.id
  parameter_group_name                = var.parameter_group_name
  option_group_name                   = aws_db_option_group.db_opt_gr.id
  storage_encrypted                   = true
  license_model                       = "postgesql-license"
  availability_zone                   = var.availability_zone
  multi_az                            = var.multi_az
  publicly_accessible                 = var.publicly_accessible
  allow_major_version_upgrade         = var.allow_major_version_upgrade
  backup_retention_period             = var.backup_retention_period
  backup_window                       = var.backup_window
  timezone                            = var.timezone
  enabled_cloudwatch_logs_exports     = var.enabled_cloudwatch_logs_exports
  deletion_protection                 = var.deletion_protection
  tags                                = var.tags
  skip_final_snapshot                 = var.skip_final_snapshot
} 
