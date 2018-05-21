# Create the bucket for the access logs
module "logs_bucket"" {
  source      = "../tf_modules/aws/bucket"
  name 	      = "${var.prefix}-access-logs"

}
# Create the bucket for the database
module "db_bucket" {
  source      = "../tf_modules/aws/bucket"
  name        = "${var.prefix}-database"

}


# Create the public ip

module "eip" {
  source      = "../tf_modules/aws/eip"
}
