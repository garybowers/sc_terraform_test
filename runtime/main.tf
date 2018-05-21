module "vpc" {
  source                    = "../tf_modules/aws/vpc"
  name			    = "${var.prefix}-vpc"
  vpc_cidr		    = "${var.vpc_cidr}"
  vpc_enable_dns_hostnames  = "true"
  vpc_enable_classiclink    = "false"
}

module "internet_gateway" {
  source		    = "../tf_modules/aws/internet_gw"
  name			    = "${var.prefix}-gw"
  vpc_id		    = "${module.vpc.aws_vpc_id}"
  route_name		    = "${var.prefix}-route"
}

module "security_group" {
  source                    = "../tf_modules/aws/securitygroup"
  name                      = "${var.prefix}-sg"
  vpc_id                    = "${module.vpc.aws_vpc_id}"
  vpc_cidr		    = "${var.vpc_cidr}"
}

module "eip" {
  source                    = "../tf_modules/aws/eip"
}

module "load_balancer" {
  source		    = "../tf_modules/aws/loadbalancer"
  name			    = "${var.prefix}-lb"
  log_bucket		    = "${var.prefix}-access-logs"
  prefix		    = "${var.prefix}"
  instance_id		    = "${module.web_instance.aws_instance_id}"
  subnet_id		    = "${module.web_subnet.aws_subnet_id}"
  security_group	    = "${module.security_group.lb_security_group}"
  subnet_id		    = "${module.web_subnet.aws_subnet_id}"
}

module "keypair" {
  source                    = "../tf_modules/aws/key_pair"
  key_name		    = "${var.ssh_user}"
  public_key_path	    = "${var.public_key_path}"
}

############## Create the subnets and the vm's for the instances ###############
module "web_subnet" {
  source                    = "../tf_modules/aws/subnet"
  name                      = "${var.prefix}-web_server_subnet"
  subnet_cidr               = "${var.public_cidr}"
  vpc_id		    = "${module.vpc.aws_vpc_id}"
  availability_zones	    = "${var.aws_azs}"
  az_count		    = "${var.az_count}"
}


module "web_instance" {
  name			    = "${var.prefix}-web-vm"
  source                    = "../tf_modules/aws/vm"
  instance_type		    = "t2.micro"
  subnetid		    = "${module.web_subnet.aws_subnet_id}"
  region		    = "${var.region}"
  ssh_user		    = "${var.ssh_user}"
  key_pair		    = "${module.keypair.aws_key_pair}"
  security_group	    = ["${module.security_group.aws_security_group}", "${module.security_group.web_security_group}"]
  az_count		    = "${var.az_count}"
  ami_id		    = "ami-be81adc7"
}

module "db_subnet" {
  source         	    = "../tf_modules/aws/subnet"
  name                      = "${var.prefix}-db_server_subnet"
  subnet_cidr               = "${var.database_cidr}"
  vpc_id		    = "${module.vpc.aws_vpc_id}"
  availability_zones	    = "${var.aws_azs}"
  az_count		    = "${var.az_count}"
}

module "db_instance" {
  name			    = "${var.prefix}-db-vm"
  source                    = "../tf_modules/aws/vm"
  instance_type		    = "t2.micro"
  subnetid		    = "${module.db_subnet.aws_subnet_id}"
  region		    = "${var.region}"
  ssh_user		    = "${var.ssh_user}"
  security_group	    = ["${module.security_group.aws_security_group}", "${module.security_group.db_security_group}"]
  key_pair		    = "${module.keypair.aws_key_pair}"
  az_count		    = "${var.az_count}"
  ami_id		    = "ami-2f8fa356"
}

module "app_subnet" {
  source                    = "../tf_modules/aws/subnet"
  name                      = "${var.prefix}-app_server_subnet"
  subnet_cidr               = "${var.appserver_cidr}"
  vpc_id		    = "${module.vpc.aws_vpc_id}"
  availability_zones	    = "${var.aws_azs}"
  az_count		    = "${var.az_count}"
}

module "app_instance" {
  name			    = "${var.prefix}-app-vm"
  source                    = "../tf_modules/aws/vm"
  instance_type		    = "t2.micro"
  subnetid		    = "${module.app_subnet.aws_subnet_id}"
  region		    = "${var.region}"
  ssh_user		    = "${var.ssh_user}"
  security_group	    = ["${module.security_group.aws_security_group}", "${module.security_group.app_security_group}"]
  key_pair		    = "${module.keypair.aws_key_pair}"
  az_count		    = "${var.az_count}"
  ami_id		    = "ami-a681addf"
}

module "route_association" {
  source                    = "../tf_modules/aws/route_assoc"
  subnet_id                 = "${module.web_subnet.aws_subnet_id}"
  route_id                  = "${module.internet_gateway.aws_route_table}"
}

module "nat_gateway" {
  source                    = "../tf_modules/aws/nat_gw"
  subnet_id		    = ["${module.web_subnet.aws_subnet_id}"]
  nat_eip		    = ["${module.eip.aws_eip_nat_ips}"]
  name			    = "${var.prefix}-nat-gw"
}
