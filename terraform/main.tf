provider "aws" {
    region = "us-west-1"
}
resource "aws_instance" "web" {
  instance_type = "t2.micro"
  ami = "ami-09b4b74c"
}