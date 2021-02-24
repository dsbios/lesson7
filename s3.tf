resource "aws_s3_bucket" "bucket333" {
  bucket = "bucket333"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"

  }
}
resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.bucket333.id
  acl = "public-read"
  key    = "n.jpg"
  source = "n.jpg"
  etag = filemd5("n.jpg")
}
