terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  alias  = "region1"
  region = var.region1
}

provider "aws" {
  alias  = "region2"
  region = var.region2
}

resource "aws_instance" "ec2_region1" {
  provider      = aws.region1
  ami           = var.ami_region1
  instance_type = var.instance_type
  key_name      = var.key_name_region1

  tags = {
    Name = "Instance-${var.region1}"
  }
}

resource "aws_instance" "ec2_region2" {
  provider      = aws.region2
  ami           = var.ami_region2
  instance_type = var.instance_type
  key_name      = var.key_name_region2

  tags = {
    Name = "Instance-${var.region2}"
  }
}