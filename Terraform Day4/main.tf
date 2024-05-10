#create Vpc
resource "aws_vpc" "dhev" {
    cidr_block = "10.0.0.0/16"

    tags = {
      Name ="cust_VPC"
    }
  
}
#Create Subnet
resource "aws_subnet" "dhev" {
    vpc_id = aws_vpc.dhev.id
    cidr_block = "10.0.0.0/17"

    tags = {
      Name ="vasuSN"
    }
  
}
#create IG
resource "aws_internet_gateway" "dhev" {
    vpc_id = aws_vpc.dhev.id
    tags = {
      Name ="Vasu-IG"
    }

  
}
#create RT and Edit Router
resource "aws_route_table" "dhev" {
    vpc_id = aws_vpc.dhev.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dhev.id
    }
    tags = {
      Name="Vasurt"
    }
}

#Subnet Association
resource "aws_route_table_association" "dhev" {
    subnet_id = aws_subnet.dhev.id
    route_table_id = aws_route_table.dhev.id
}

#Create SG
resource "aws_security_group" "dhev" {
    vpc_id = aws_vpc.dhev.id
    tags = {
      Name ="VASUSG"
    }
  ingress {
    description = "TLSfromvpc"
    from_port = 22
    to_port = 22
    protocol = "Tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress {
    description = "TLSfromvpc"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  }

#create EC2
resource "aws_instance" "dhev" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
     subnet_id = aws_subnet.dhev.id
     security_groups = [ aws_security_group.dhev.id ]
    tags = {
      Name ="dhevvvvv"
    }
  
}

