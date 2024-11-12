provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami = "ami-0dee22c13ea7a9a67" # Change the AMI 
  instance_type = "t2.micro"
}