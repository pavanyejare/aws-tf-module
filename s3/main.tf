resource "aws_s3_bucket_object" "s3" {
  bucket = var.bucket-name
  tags   = var.tags
}
