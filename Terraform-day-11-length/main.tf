resource "aws_instance" "sandbox" {
  ami           = var.ami
  instance_type = var.instance_type
  count         = length(var.sandboxes)
 #tags = {
#     #   Name = "webec2"
#       Name = "webec2-${count.index}"
#     }
# }
  tags = {
    Name = var.sandboxes[count.index]
  }
}