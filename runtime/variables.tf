variable "prefix" {
  type = "string"
  description = "Prefix of all resource names"
}

variable "vpc_cidr" {
  type = "string"
  description = "CIDR for the whole vpc"
}

variable "public_cidr" {
  type = "string"
  description = "CIDR for the public facing infrastructure"
}

variable "database_cidr" {
  type = "string"
  description = "CIDR for the database servers"
}

variable "appserver_cidr" {
  type = "string"
  description = "CIDR for the application servers"
}

variable "az_count" {
  type = "string"
  description = "Availability Zone count"
}

variable "aws_azs" {
  type = "list"
  description = "Availability zone list as comma seperated list"
}

variable "region" {
  type = "string"
  description = "Region"
}

variable "ssh_user" {
  type = "string"
  description = "Username and keyname for SSH"
}

variable "public_key_path" {
  type = "string"
  description = "Path to the ssh public key"
}
