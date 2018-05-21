##
# AWS Subnet
##

resource "aws_subnet" "default" {
  vpc_id      =   "${var.vpc_id}"
  cidr_block  =   "${var.subnet_cidr}"
  count       =   "${var.az_count}"
  availability_zone = "${element(split(", ", var.availability_zones), count.index)}" 
  tags {
      Name = "${var.name}"
  } 
}
