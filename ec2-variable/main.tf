provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "instance1" {
    instance_type = var.aws_instance_value
    ami = var.ami_value
}
