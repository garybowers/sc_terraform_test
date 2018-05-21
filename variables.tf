terraform {
	required_version = ">= 0.11.7"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region" {
  default = "eu-west-1"
}

provider "aws" {
	region = "eu-west-1"	
	access_key = "${var.aws_access_key}"
	secret_key = "${var.aws_secret_key}"
}
