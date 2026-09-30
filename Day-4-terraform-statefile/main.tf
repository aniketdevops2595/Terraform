resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    tags = {
      Name ="vpc_tag"
    }
}


resource "aws_subnet" "dev" {
    cidr_block =var.subnet_cidr
    vpc_id = aws_vpc.main.id
    tags ={
        Name = "subnet_tag"
    }
}

resource "aws_instance" "web" {
    ami = "ami-0b245cc5f82576748"
    instance_type ="t3.micro"
    subnet_id =aws_subnet.dev.id

    tags ={
        Name ="web_server"
    }

}

