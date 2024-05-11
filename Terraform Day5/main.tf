resource "aws_s3_bucket" "name" {
  bucket = "mayseasonmangoes"
}

resource "aws_s3_bucket_versioning" "name" {
  bucket = aws_s3_bucket.name.id
  versioning_configuration {
    status = "Disabled"     
  }
}

data "aws_s3_bucket_objects" "bucket_objects" {
  bucket = aws_s3_bucket.name.id
}

locals {
  object_keys = { for key in data.aws_s3_bucket_objects.bucket_objects.keys : key => key }
}

resource "aws_s3_bucket_object" "delete_objects" {
  for_each = local.object_keys

  bucket = aws_s3_bucket.name.id
  key    = each.key

  # Specify action as "delete" to delete the object
  lifecycle {
    prevent_destroy = false
  }
}
