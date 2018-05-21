resource "aws_eip" "default" {
  count = 2 
  vpc = true
}
