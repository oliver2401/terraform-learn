provider "aws" {
  #region = "us-east-1"
}

#provider "linode" {
#  # token = "..."
#}

variable "cidr_blocks" {
  description = "cidr block and name tags for vpc and subnets"
  #default = "10.0.10.0/24"
  type = list(object({
    cidr_block = string
    name = string
  }))
}

variable "avail_zone" {}
resource "aws_vpc" "development-vpc" {
  cidr_block = var.cidr_blocks[0].cidr_block
  tags = {
    Name: var.cidr_blocks[0].name
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id = aws_vpc.development-vpc.id
  cidr_block = var.cidr_blocks[1].cidr_block #"10.0.10.0/24"
  availability_zone = var.avail_zone #"us-east-1a"
  tags = {
    Name: var.cidr_blocks[0].name
  }
}

output "dev-vpc-id" {
  value = aws_vpc.development-vpc.id
}

output "dev-subnet-id" {
  value = aws_subnet.dev-subnet-1.id
}