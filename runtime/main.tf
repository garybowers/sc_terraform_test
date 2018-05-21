
module "vpc" {
  source                    = "../tf_modules/aws/vpc"
  name			    = "gary_test_vpc"
  vpc_cidr		    = "${var.vpc_cidr}"
  vpc_instance_tenancy      = "dedicated"
  vpc_enable_dns_hostnames  = "true"
  vpc_enable_classiclink    = "false"
}

module "nat_gateway" {
  source		    = "../tf_modules/aws/internet_gw"
  name			    = "${var.prefix}-gw"
  vpc_id		    = "${module.vpc.aws_vpc_id}"
}

module "load_balancer" {
  source		    = "../tf_modules/aws/loadbalancer"
  name			    = "${var.prefix}-lb"
}

module "web_subnet" {
  source                    = "../tf_modules/aws/subnet"
  name                      = "${var.prefix}-web_server_subnet"
  subnet_cidr               = "${var.public_cidr}"
  vpc_id		    = "${module.vpc.aws_vpc_id}"
}

module "db_subnet" {
  source         	    = "../tf_modules/aws/subnet"
  name                      = "${var.prefix}-db_server_subnet"
  subnet_cidr               = "${var.database_cidr}"
  vpc_id		    = "${module.vpc.aws_vpc_id}"
}

module "application_subnet" {
  source                    = "../tf_modules/aws/subnet"
  name                      = "${var.prefix}-app_server_subnet"
  subnet_cidr               = "${var.appserver_cidr}"
  vpc_id		    = "${module.vpc.aws_vpc_id}"
}
