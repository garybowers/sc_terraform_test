output "aws_eip_nat_ips" {
  value = ["${aws_eip.default.*.public_ip}"]
}
