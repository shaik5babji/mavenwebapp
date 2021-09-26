resource "aws_s3_bucket" "devopsin60mintestbkt" {
  bucket = "devopsin60min-test-bkt"
  acl    = "private"

  versioning {
    enabled = true
  }
}
