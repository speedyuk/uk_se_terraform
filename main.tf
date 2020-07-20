# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region  = "eu-west-2"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> v2.0"

  name = "${var.prefix}-f5-vpc"
  cidr = "10.0.0.0/16"


  azs             = ["eu-west-2a"]
  public_subnets  = ["10.0.0.0/24", "10.0.1.0/24","10.0.10.0/24", "10.0.11.0/24"]
  private_subnets = ["10.0.2.0/24", "10.0.3.0/24","10.0.12.0/24", "10.0.13.0/24"]

  enable_nat_gateway = false

  tags = {
    Environment = "F5"
  }
}