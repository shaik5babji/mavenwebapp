resource "aws_s3_bucket" "b" {
  bucket = "DevOpsIn60Min_test_bkt"
  acl    = "private"

  versioning {
    enabled = true
  }
}
