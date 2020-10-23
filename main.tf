# Configure the AWS Provider
provider "aws" {
  region = "${var.region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}


resource "aws_security_group" "GSy-group" {
  name = "allow_connection"
  #SSH
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  #HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

vpc_security_group_ids = [aws_security_group.allow_connecction.id]

resource "aws_instance" "GSy-test-server" {
  ami           = lookup(var.ami_id, var.region)
  instance_type = var.instance_type

  user_data = "${file(doker_install.sh)}"

  tags = {
    Name = "Linux-VM-Docker"
  }
}