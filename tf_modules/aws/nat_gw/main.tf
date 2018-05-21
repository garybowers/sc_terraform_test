resource "aws_nat_gateway" "default" {
  allocation_id = "${var.nat_eip}"
  subnet_id     = "${var.subnet_id}"
}
