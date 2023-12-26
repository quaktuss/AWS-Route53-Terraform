terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region  = var.region_name
}

module "aws_route53_record" {
  source = "./modules/aws_route53_record"
}