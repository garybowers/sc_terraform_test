resource "aws_elb" "default" {
  name = "${var.name}"
  #availability_zones = ["${var.availability_zones}"]
  #availability_zones = "${element(split(", ", var.availability_zones), count.index)}" 
  availability_zones = ["eu-west-1a","eu-west-1b"]

  access_logs {
    bucket        = "${var.log_bucket}"
    bucket_prefix = "${var.prefix}"
    interval      = 60
  }

  security_groups = ["${var.security_group}"]
  instances       = ["${var.instance_id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

# Need a certificate
#  listener {
#    instance_port      = 80
#    instance_protocol  = "http"
#    lb_port            = 443
#    lb_protocol        = "https"
#    ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
#  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name = "${var.name}"
  }

}
