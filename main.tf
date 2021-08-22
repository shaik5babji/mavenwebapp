resource "aws_s3_bucket" "b" {
  bucket = "devOpsin60min_test_bkt"
  acl    = "private"

  versioning {
    enabled = true
  }
}
