##########
# AWS VPC
##########

resource "aws_vpc" "vpc" {
  count = "1"

  instance_tenancy = "${var.vpc_instance_tenancy}"
  enable_dns_support = "${var.vpc_enable_dns_support}"
  enable_dns_hostnames = "${var.vpc_enable_dns_hostnames}"
  enable_classiclink = "${var.vpc_enable_classiclink}"
  tags = "${merge(var.global_tags, map("Name", "${var.aws_vpc_name}"))}"
  lifecycle = { 
                ignore_changes = ["tags"]
              }  
  
}
