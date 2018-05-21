##
# AWS Subnet
##

resource "aws_subnet" "subnetwork" {
  vpc_id      =   "${aws_vpc.terraformmain.id}"
  cidr_block  =   "${var.subnet_cidr}"
  tags {
      Name = "${var.name}"
  } 
}
