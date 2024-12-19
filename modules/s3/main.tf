resource "aws_s3_bucket" "bucket161224" {
  bucket = var.bucket_name 

  tags = {
    Name      = var.bucket_name
    terraform = true
  }
}