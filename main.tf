provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "react_app_bucket" {
  bucket = "web-dev-tools-react-bucket" # must be globally unique
  force_destroy = true

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  tags = {
    Name        = "ReactAppBucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "react_app_bucket_block" {
  bucket = aws_s3_bucket.react_app_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "allow_public_read" {
  bucket = aws_s3_bucket.react_app_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.react_app_bucket.arn}/*"
      }
    ]
  })
}

resource "aws_s3_object" "react_build" {
  for_each = fileset("${path.module}/build", "**/*")

  bucket       = aws_s3_bucket.react_app_bucket.id
  key          = each.value
  source       = "${path.module}/build/${each.value}"
  etag         = filemd5("${path.module}/build/${each.value}")
  content_type = lookup(var.mime_types, substr(each.value, length(each.value) - length(regex("\\.[^\\.]+$", each.value)), ""), "application/octet-stream")
}

variable "mime_types" {
  type = map(string)
  default = {
    ".html" = "text/html"
    ".css"  = "text/css"
    ".js"   = "application/javascript"
    ".json" = "application/json"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".jpeg" = "image/jpeg"
    ".svg"  = "image/svg+xml"
    ".ico"  = "image/x-icon"
    ".txt"  = "text/plain"
  }
}

output "website_url" {
  value = aws_s3_bucket.react_app_bucket.website_endpoint
}
