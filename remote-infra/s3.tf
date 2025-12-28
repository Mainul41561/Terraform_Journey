resource "aws_s3_bucket" "state_bucket" {
  bucket = "tfstate-s3-bucket"
  tags = {
    Name        = "tfstate_s3_bucket"
  }
}