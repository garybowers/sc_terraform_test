variable "name" {
  type         = "string"
}

variable "amiid" {
  type         = "string"
  default      = "ami-b47b4bcd"
  description  = "AMI Id for the os image"
}
