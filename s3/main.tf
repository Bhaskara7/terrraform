provider "aws" {
  region = ap-south-1
}

module "aws_s3_bucket" {
    source = "../modules/s3"
  
}