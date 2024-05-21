locals {
  bucket_name ="${var.layer}-${var.env}-bucket-vasudevlkkl"

}
resource "aws_s3_bucket" "demo" {
    bucket = local.bucket_name
  
tags= {
    Name =local.bucket_name
    Enivornment = var.env
    }
}