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
  default = [ "dev","prod"]
}