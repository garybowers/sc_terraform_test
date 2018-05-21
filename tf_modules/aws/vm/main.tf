resource "aws_instance" "default" {
  connection {
    user = "${var.ssh_user}"
  }

  instance_type = "${var.instance_type}"

  ami = "${var.ami_id}"
  key_name = "${var.key_pair}"
  vpc_security_group_ids = ["${var.security_group}"]
  subnet_id = "${var.subnetid}"

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y install nginx",
      "sudo service nginx start",
    ]
  }
}
