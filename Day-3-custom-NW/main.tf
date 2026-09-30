#vpc creation 
resource "aws_vpc" "name" {
    cidr_block =var.vpc_cidr
    tags = {
        Name = "custom-vpc"
    }
}

resource "aws_subnet" "subnet-1"{
    vpc_id  =aws_vpc.name.id
    cidr_block = var.subnet_cidr
    tags = {
        Name = "custom -subnet-1"
        
    }
}

resource "aws_internet_gateway " "igw" {
    vpc_id =aws_vpc.name.id
    tags ={
        name = "custom-rt"
    }
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_assocoation " "rta" {
    subnet_id = aws_subnet.subnet-1.id
    route_table_id = aws_route_table.rt.id


}
resource "aws_subnet" "private_subnet" {
    vpc_id =aws_vpc.name.id 
    cidr_block = var.private_subnet_cidr

}

resource "aws_subnet" "private_subnet_1"{
    vpc_id = aws_vpc.name.id
    cidr_block = var.private_subnet_cidr_1
    availability_zone = "us-east-1"
    
    tags ={
        Name = "private-subnet-1"
    }
}

# elastic ip for NAT gateway 
resource = "aws_eip"  "nat" {
    domain ="vpc"
    tags = {
        Name = "nat-eip"
    }
}

#NAT Gateway (placed in a public subnet)
resource "aws_nat_gateway" "main" {
    allocation_id = aws_eip.nat.id
    subnet_id = aws_subnet.pub
}


