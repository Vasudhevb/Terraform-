resource "aws_instance" "dependent" {
    ami = "ami-0cc9838aa7ab1dce7"
    instance_type = "t2.micro"
    key_name = "anuraj"

    tags = {
        Name ="depedency"
    }
  
}
resource "aws_s3_bucket" "dependent" {
    bucket = "aws-s3-dependency-praactice"
  depends_on = [ aws_instance.dependent ]
  
}