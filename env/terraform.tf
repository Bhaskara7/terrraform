provider "aws" {
  region = "ap-south-1"
}

variable "ami" {
  description = "ami value for instance"
}

variable "instance_type" {
  description = "value for instance_type"
  type = map(string)

  default = {
    "dev" = "t2.micro"
    "stage" = "t2.micro"
    "prod" = "t2.micro"
  }

}

module "aws_instance" {
    source = "./modules"
    ami = var.ami
    instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
}