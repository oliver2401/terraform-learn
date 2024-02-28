terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.20.1" #"5.38.0" #version = "5.21.0"
    }
    linode = {
      source = "linode/linode"
      version = "2.9.5"
    }
  }
}