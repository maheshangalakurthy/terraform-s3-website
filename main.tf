# Create S3 Bucket Resource
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  tags          = var.tags
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "example" {
  depends_on = [ aws_s3_bucket.s3_bucket ]
  bucket = aws_s3_bucket.s3_bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

# resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
#   bucket = aws_s3_bucket.s3_bucket.id
#   policy = <<EOF
#   {
#   "Version": "2012-10-17",
#   "Statement": [
#       {
#           "Sid": "PublicReadGetObject",
#           "Effect": "Allow",
#           "Principal": "*",
#           "Action": [
#               "s3:GetObject"
#           ],
#           "Resource": [
#               "arn:aws:s3:::${var.bucket_name}/*"
#           ]
#       }
#     ]
#   }
# EOF
# }

