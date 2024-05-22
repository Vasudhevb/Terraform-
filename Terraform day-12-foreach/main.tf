variable "ami" {
  type    = string
  default = "ami-0cc9838aa7ab1dce7"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "sandboxes" {
  type    = list(string)
  default = ["dev","vasu"]
}


resource "aws_instance" "sandbox" {
  ami           = var.ami
  instance_type = var.instance_type
  for_each      = toset(var.sandboxes)
#   count = length(var.sandboxes)
  tags = {
    Name = each.value # for a set, each.value and each.key is the same
  }
}