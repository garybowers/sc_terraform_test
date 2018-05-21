resource "aws_s3_bucket" "default" {
  bucket = "${var.name}"
  acl    = "private"
}

resource "aws_s3_bucket_policy" "default" {
  bucket = "${aws_s3_bucket.default.id}"
  policy =<<POLICY
{
  "Version": "2012-10-17",
  "Id": "bucket_policy_log",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::${var.name}/*"
    } 
  ]
}
POLICY
}

#### NOTE:  IP address based s3 mapping i coulnd't get the loadbalancer's ip in time so I threw in a catch all cidr of 0.0.0.0/0 In practice
###         this is REALLY_!!! bad!


