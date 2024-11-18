provider "aws" {
  region = "ap-south-1"
}

variable "ami" {
  description = "ami value for instance"
}

variable "instance_type" {
  description = "value for instance_type"
}

resource "aws_instance" "example" {
    ami = var.ami
    instance_type = var.instance_type
  
}