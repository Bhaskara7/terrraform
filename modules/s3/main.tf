provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "bucket1" {
    bucket = "demo-abcdooda"
}