
module state "state" {
  prefix         = "test1"
  source         = "./state"
}

module runtime "runtime" {
  region         = "europe-west1"
  prefix         = "test1"
  source         = "./runtime" 
  vpc_cidr       = "192.168.0.0/16"
  public_cidr    = "192.168.101.0/24"
  database_cidr  = "192.168.201.0/24"
  appserver_cidr = "192.168.1.0/24"
  aws_azs        = "eu-west-1a, eu-west-1b"
  az_count       = 2
  public_key_path = "~/.ssh/id_rsa.pub"
  ssh_user       = "gary"
}
