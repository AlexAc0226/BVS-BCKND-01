resource "aws_s3_bucket" "content_bucket" {
  bucket = var.bucket_name
  tags = {
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "content_bucket_versioning" {
  bucket = aws_s3_bucket.content_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}