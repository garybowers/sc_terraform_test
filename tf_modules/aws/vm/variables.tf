variable "name" {
  type         = "string"
}

variable "ami_id" {
  type         = "string"
  default      = "ami-f90a4880"
  description  = "AMI Id for the os image"
}

variable "subnetid" {
  type         = "list"
  description  = "id of the subnet the vm should be attached to"
}


variable "instance_type" {
  type         = "string"
  description  = "instance type e.g. t1-micro"
}

variable "region" {
  type         = "string"
  description  = "AWS Region"
}

variable "ssh_user" {
  type         = "string"
  description  = "Name of the ssh user to create"
}

variable "security_group" {
  type         = "list"
}

variable "key_pair" {
  type         = "string"
}

variable "az_count" {
  type 	       = "string"
  description  = "Number of availability zones"
}
