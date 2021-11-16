provider "aws" {
  region = "ap-south-1"

}

resource "aws_instance" "MyFirstServer" {
  ami           = "ami-0c2b8ca1dad447f8a"
  instance_type = "t2.micro"

}
