resource "aws_cloudtrail" "mytrail"  {
  name = "mytrail"
  s3_bucket_name = "mytrail_bucket_test1"
  s3_key_prefix = "prefix"
  include_global_service_events = false
}

resource "aws_s3_bucket" "mytrail_bucket_test1" {
  bucket = "mytrail_bucket_test1"
  acl = "private"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::mytrail_bucket_test1"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::mytrail_bucket_test1/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}
