resource "aws_instance" "dev" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    count = length(var.vasu)

tags = {
Name =var.vasu[count.index]
}
}