provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

terraform {
  backend "s3" {
    bucket = "k2yode-eu-west-bucket"
    key    = "euwest.tfstate"
    region = "eu-west-2"
  }
}

resource "aws_instance" "instance_x" {
  ami   = "ami-0f79f2f1eb693b53b"
  count = 2

  #instance type
  instance_type = "t2.micro"

  #instance tags
  tags = {
    Name = "eu-west-Tooling-Server-${count.index + 1}"
    Test = "TRUE_FALSE"
  }

  #create security group
  vpc_security_group_ids = ["${aws_security_group.eu-west-sec-sg.id}"]

  #passing key
  key_name = "eu-devopskey"
}
