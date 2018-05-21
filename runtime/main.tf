
module "vpc" {
  source                    = "../tf_modules/aws/vpc"
  name			    = "${var.prefix}-vpc"
  vpc_cidr		    = "${var.vpc_cidr}"
  vpc_instance_tenancy      = "dedicated"
  vpc_enable_dns_hostnames  = "true"
  vpc_enable_classiclink    = "false"
}

module "internet_gateway" {
  source		    = "../tf_modules/aws/internet_gw"
  name			    = "${var.prefix}-gw"
  vpc_id		    = "${module.vpc.aws_vpc_id}"
}

module "security_group" {
  source                    = "../tf_modules/aws/securitygroup"
  name                      = "${var.prefix}-sg"
  vpc_id                    = "${module.vpc.aws_vpc_id}"
}

module "eip" {
  source                    = "../tf_modules/aws/eip"
}

#module "nat_gateway" {
#  source                    = "../tf_modules/aws/nat_gw"
#}

#module "load_balancer" {
#  source		    = "../tf_modules/aws/loadbalancer"
#  name			    = "${var.prefix}-lb"
#  vpc_id		    = "${module.vpc.aws_vpc_id}"
#}

############## Create the subnets and the vm's for the instances ###############
module "web_subnet" {
  source                    = "../tf_modules/aws/subnet"
  name                      = "${var.prefix}-web_server_subnet"
  subnet_cidr               = "${var.public_cidr}"
  vpc_id		    = "${module.vpc.aws_vpc_id}"
}

module "web_instance" {
  name			    = "${var.prefix}-web-vm"
  source                    = "../tf_modules/aws/vm"
  instance_type		    = "t2.micro"
  vpc_id		    = "${module.vpc.aws_vpc_id}"
  subnetid		    = "${module.web_subnet.aws_subnet_id}"
  region		    = "${var.region}"
}

module "db_subnet" {
  source         	    = "../tf_modules/aws/subnet"
  name                      = "${var.prefix}-db_server_subnet"
  subnet_cidr               = "${var.database_cidr}"
  vpc_id		    = "${module.vpc.aws_vpc_id}"
}

module "db_instance" {
  name			    = "${var.prefix}-web-vm"
  source                    = "../tf_modules/aws/vm"
  instance_type		    = "t2.micro"
  vpc_id		    = "${module.vpc.aws_vpc_id}"
  subnetid		    = "${module.web_subnet.aws_subnet_id}"
  region		    = "${var.region}"
}

module "application_subnet" {
  source                    = "../tf_modules/aws/subnet"
  name                      = "${var.prefix}-app_server_subnet"
  subnet_cidr               = "${var.appserver_cidr}"
  vpc_id		    = "${module.vpc.aws_vpc_id}"
}

module "app_instance" {
  name			    = "${var.prefix}-web-vm"
  source                    = "../tf_modules/aws/vm"
  instance_type		    = "t2.micro"
  vpc_id		    = "${module.vpc.aws_vpc_id}"
  subnetid		    = "${module.web_subnet.aws_subnet_id}"
  region		    = "${var.region}"
}

