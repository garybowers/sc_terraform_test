resource "aws_eip" "default" {
  count = 1
  vpc = true
}
