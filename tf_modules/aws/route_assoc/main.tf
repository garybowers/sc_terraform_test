resource "aws_route_table_association" "a" {
  count          = "${var.az_count}"
  subnet_id      = "${element(var.subnet_id, count.index)}"
  route_table_id = "${var.route_id}"
}
