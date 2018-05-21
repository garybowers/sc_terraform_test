resource "aws_default_vpc" "default" {
    tags {
        Name = "Default VPC"
    }
}

resource "aws_security_group" "elb" {
  name        = "${var.name}-elb"
  description = "Security Group for ELB"
  vpc_id      = "${var.vpc_id}"

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "default" {
  name        = "${var.name}-default"
  description = "Security group applied as default to EC2 Instances"
  vpc_id      = "${var.vpc_id}"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from the VPC
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cidr}"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "web" {

  name 		= "${var.name}-web"
  description 	= "Security group applied to webservers"
  vpc_id	= "${var.vpc_id}"

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
	Name = "${var.name}-web"
  }
}

resource "aws_security_group" "app" {
  name 		= "${var.name}-app"
  description 	= "Security group applied to appservers"
  vpc_id	= "${var.vpc_id}"

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
	Name = "${var.name}-app"
  }

}

resource "aws_security_group" "db" {
  name 		= "${var.name}-db"
  description 	= "Security group applied to dbservers"
  vpc_id	= "${var.vpc_id}"

  ingress {
      from_port = 3306 
      to_port = 3306
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
	Name = "${var.name}-db"
  }

}
