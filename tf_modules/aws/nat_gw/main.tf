resource "aws_nat_gateway" "default" {
  count = "2"
  allocation_id = "${element(var.nat_eip,count.index)}"
  subnet_id = "${element(var.subnet_id,count.index)}"
}
