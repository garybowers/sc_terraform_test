##
# AWS Subnet
##

resource "aws_subnet" "default" {
  count       =   "${var.az_count}" 
  vpc_id      =   "${var.vpc_id}"
  cidr_block  =   "${element(split(", ", var.subnet_cidr), count.index)}"
  availability_zone = "${element(split(", ", var.availability_zones), count.index)}" 
  tags {
      Name = "${var.name}-${element(split(", ", var.availability_zones), count.index)}"
  } 
}
