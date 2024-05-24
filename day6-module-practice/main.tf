module "vasd" {
    source = "../Day6-module"
    instance_type = "t2.micro"
    key_name = "anuraj"
    ami = "ami-0cc9838aa7ab1dce7"

       
}