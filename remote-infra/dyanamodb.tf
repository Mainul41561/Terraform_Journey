resource "aws_dynamodb_table" "example" {
  name         = "tfstate-s3-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name        = "tfstate_s3_table"
  }
}