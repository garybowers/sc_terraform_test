
module "vpc" {
  source = "../tf_modules/aws/vpc"
}

module "subnet" {
  source = "../tf_modules/aws/subnet"
}

