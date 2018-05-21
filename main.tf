
module runtime "runtime" {
  prefix         = "gary_test"
  source         = "./runtime" 
  vpc_cidr       = "192.168.0.0/16"
  public_cidr    = "192.168.101.0/24"
  database_cidr  = "192.168.201.0/24"
  appserver_cidr = "192.168.1.0/24"

}
