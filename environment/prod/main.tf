terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-west-1"
}


module "networking" {
  source      = "../../modules/network"
  vpc_cidr_block                = "10.0.0.0/16"
  max_subnets                   = 6
  public_cidrs                  = ["10.0.5.0/24", "10.0.6.0/24", "10.0.9.0/24"]
  private_cidrs                 = ["10.0.7.0/24", "10.0.8.0/24", "10.0.10.0/24"]
  azs                           = ["us-west-1b",  "us-west-1c", "us-west-2a"]
  instance_type                 = "t2.medium"
  key_name                      = "prod-bastion-host-key"
  associate_public_ip_address   = "true"
  env                           = "prod"
}