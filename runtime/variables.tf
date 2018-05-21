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
