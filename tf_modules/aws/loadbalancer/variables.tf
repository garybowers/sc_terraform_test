##
# Inputs
##

variable "name" {
  type = "string"
}

variable "prefix" {
  type = "string"
}

variable "log_bucket" {
  type = "string"
}

variable "instance_id" {
  type = "list"
}

variable "subnet_id" {
  type = "string"
}

variable "security_group" {
  type = "string"
}

variable "subnet_id" {
  type = "list"
}
