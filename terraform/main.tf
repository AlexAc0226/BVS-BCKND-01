provider "aws" {
  region = "us-east-1"
  access_key = "test"
  secret_key = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true
  endpoints {
    s3 = "http://localhost:4510"
  }
}

resource "aws_s3_bucket" "simple_bucket" {
  bucket = "bravas-simple-bucket"
  tags = {
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "simple_bucket_versioning" {
  bucket = aws_s3_bucket.simple_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}