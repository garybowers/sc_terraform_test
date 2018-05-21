resource "aws_instance" "instance" {
  most_recent = true

  filter {
    name = "${var.name}"
    ami_id = "${var.amiid}" 
  }
}
