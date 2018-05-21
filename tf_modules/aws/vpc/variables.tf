variable "vpc_instance_tenancy" {
  type = "string"
}
variable "vpc_enable_dns_support" {
  type = "string"
  default = "true"
}
variable "vpc_enable_dns_hostnames" {
  type = "string"
}
variable "vpc_enable_classiclink" {
  type = "string"
}

variable "name" {
  type = "string"
}

variable "vpc_cidr" {
  type = "string"
}
