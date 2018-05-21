output "aws_nat_gateway_count" {
  value = "${length(aws_nat_gateway.default.*.id)}"
}

output "aws_nat_gateway_ids" {
  value = ["${aws_nat_gateway.default.*.id}"]
}
