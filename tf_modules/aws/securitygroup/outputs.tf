output "aws_security_group" {
  value  = "${aws_security_group.default.id}"
}

output "lb_security_group" {
  value  = "${aws_security_group.elb.id}"
}
