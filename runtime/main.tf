
module "vpc" {
  source = "../tf_modules/aws/vpc"
}

module "subnet" {
  source = "../tf_modules/aws/subnet"
}

module "loadbalancer" {
  source = "../tf_modules/aws/loadbalancer"
}
