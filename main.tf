provider "aws" {
  region = "us-east-1"
  access_key = "AKIAYS5NAIUUEGOWBTN5"
  secret_key = "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"
}

resource "aws_instance" "MyFirstServer" {
  ami           = "ami-0c2b8ca1dad447f8a"
  instance_type = "t2.micro"

}