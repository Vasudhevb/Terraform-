resource "aws_instance" "dev" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    count = 2

tags = {
Name ="test- ${count.index}"
}
}