
resource "aws_instance" "dev" {
    ami = data.aws_ami.amzlinux.id
    instance_type = "t2.micro"
    

    tags = {
      Name = "dev-ec2"
    }
}