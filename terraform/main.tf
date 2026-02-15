provider "aws" {
  region                      = "us-west-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true

  access_key = "dummy"
  secret_key = "dummy"
}
resource "aws_instance" "web" {
  instance_type = "t2.micro"
  ami           = "ami-09b4b74c"
}
