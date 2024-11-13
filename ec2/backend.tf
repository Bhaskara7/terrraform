terraform {
  backend "s3" {
    bucket         = "demo-backend-tf" 
    key            = "tf/terraform.tfstate"
    region         = "ap-south-1"
  }
}