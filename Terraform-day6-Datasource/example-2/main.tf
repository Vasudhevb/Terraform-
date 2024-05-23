provider "aws" {
  
}
data "aws_subnet" "selected" {
    filter {
      name = "tag:Name"
      values = ["Data"]
    }
  
}

resource "aws_instance" "dev" {
    ami = "ami-0cc9838aa7ab1dce7"
    instance_type = "t2.micro"
    key_name = "anuraj"
    subnet_id =data.aws_subnet.selected.id
   tags = {
      Name = "dev-ec2"
    }
}