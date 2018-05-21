resource "aws_internet_gateway" "default" {
  vpc_id    = "${var.vpc_id}"
  tags {
    Name    = "${var.name}"
  }
}
resource "aws_route_table" "default" {
  vpc_id    = "${var.vpc_id}"
  route {
    cidr_block   = "0.0.0.0/0"
    gateway_id   = "${aws_internet_gateway.default.id}" 
  } 
  tags {
    Name = "${var.name}"
  }
}
