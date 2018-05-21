resource "aws_instance" "default" {
  tags {
    Name = "${var.name}"
  }
  connection {
    user = "${var.ssh_user}"
  }

  instance_type = "${var.instance_type}"

  ami = "${var.ami_id}"
  key_name = "${var.key_pair}"
  vpc_security_group_ids = ["${var.security_group}"]
  subnet_id = "${var.subnetid}"
}
