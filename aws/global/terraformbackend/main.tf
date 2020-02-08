resource "aws_s3_bucket" "tfs-uzihoon-lambda-project" {
  bucket        = "tfs-uzihoon-lambda-project"
  force_destroy = false
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_dynamodb_table" "tfl-uzihoon-lambda-project" {
  name           = "tfl-uzihoon-lambda-project"
  hash_key       = "LockID"
  read_capacity  = 5
  write_capacity = 5
  attribute {
    name = "LockID"
    type = "S"
  }
}
