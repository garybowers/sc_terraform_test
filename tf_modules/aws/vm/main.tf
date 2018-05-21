resource "aws_instance" "default" {
  count				= "${var.az_count}" 
  instance_type 		= "${var.instance_type}"
  ami 				= "${var.ami_id}"
  key_name 			= "${var.key_pair}"
  vpc_security_group_ids 	= ["${var.security_group}"]
  subnet_id 			= "${var.subnetid[count.index]}"
  tags {
    Name = "${var.name}"
  }
  connection {
    user = "${var.ssh_user}"
  }

}
