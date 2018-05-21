variable "multi_az_nat_gateway" {
  description = "place a NAT gateway in each AZ"
  default = 1
}

variable "single_nat_gateway" {
  description = "use a single NAT gateway to serve outbound traffic for all AZs"
  default = 0
}

variable "az_count" {
  description = "number of active availability zones in VPC"
  default = "1"
}
