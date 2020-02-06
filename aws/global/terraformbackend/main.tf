resource "aws_s3_bucket" "tfs-uzihoon" {
    bucket        = "tfs-uzihoon"
    force_destroy = false
    versioning {
        enabled = true
    }
    lifecycle {
        prevent_destroy = true
    }
}

resource "aws_dynamodb_table" "tfl-uzihoon" {
    name           = "tfl-uzihoon"
    hash_key       = "LockID"
    read_capacity  = 5
    write_capacity = 5
    attribute {
        name = "LockID"
        type = "S"
    }
}
