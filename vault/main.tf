provider "aws" {
  region = "ap-south-1"
}

provider "vault" {
  address = "http://15.206.149.115:8200" # Replace with your Vault server address
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id  = "5e0174a9-1eda-56ae-94d9-683548a3706a" # Replace with your role_id
      secret_id = "697c63bf-4b3b-83c6-6fc1-b8ef73875426" # Replace with your secret_id
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv"        # Ensure this matches your Vault secrets engine mount
  name  = "demo"      # Name of the secret
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0dee22c13ea7a9a67"
  instance_type = "t2.micro"

  tags = {
    Name   = "test"
    Secret = data.vault_kv_secret_v2.example.data["user"]  # Using the 'user' key from the secret
  }
}
