resource "aws_nat_gateway" "default" {
  count           = "${length(var.nat_eip)}" 
  allocation_id   = "${element(var.nat_eip,count.index)}"
  subnet_id 	  = "${element(var.subnet_id,count.index)}"
  
  tags {
    Name = "${var.name}"
  }
}
