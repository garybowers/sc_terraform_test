variable "name" {
  type         = "string"
}

variable "amiid" {
  type         = "string"
  default      = "ami-b47b4bcd"
  description  = "AMI Id for the os image"
}

variable "subnetid" {
  type         = "string"
  description  = "id of the subnet the vm should be attached to"
}

variable "vpc_id" {
  type         = "string"
  description  = "id of the vpc"
}

variable "instance_type" {
  type         = "string"
  description  = "instance type e.g. t1-micro"
}

variable "region" {
  type         = "string"
  description  = "AWS Region"
}
