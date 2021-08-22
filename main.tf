# Configure the AWS Provider
provider "aws" {
  access_key = jenkins-aws-secret-key-id
  secret_key = jenkins-aws-secret-access-key
  region     = "us-east-2"
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }
}
