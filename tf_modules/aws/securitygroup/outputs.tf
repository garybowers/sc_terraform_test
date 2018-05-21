output "aws_security_group" {
  value  = "${aws_security_group.default.id}"
}

output "lb_security_group" {
  value  = "${aws_security_group.elb.id}"
}

output "db_security_group" {
  value  = "${aws_security_group.db.id}"
}

output "web_security_group" {
  value  = "${aws_security_group.web.id}"
}

output "app_security_group" {
  value  = "${aws_security_group.app.id}"
}
