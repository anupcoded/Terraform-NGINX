variable "aws_access_key" {
  description = "AWS access key."
}

variable "aws_secret_key" {
  description = "AWS secret key."
}

variable "region" {
  type    = "string"
  description = "AWS region"
  default = "us-east-2"
}
variable "ami_id" {
  type = "map"
  description = "Ubuntu Image 20.04."
  default = {
    us-east-2  = "ami-035b3c7efe6d061d5"
  }
}
variable "instance_type" {
  type    = "string"
  default = "t2.micro"
}
variable "key_name" {
  type    = "string"
  default = "aws_main_key"
}