output "vpc_id" {
    description = "VPC ID"
    value = aws_vpc.vpc.id
}

output "public_route_table_id" {
    description = "Public Route Table ID"
    value = try(aws_route.route-public.id, "") 
}

output "private_route_table_id" {
    description = "Private Route Table ID"
    value = try(aws_route.route-private[0].id, "") 
}

output "public_subnet_01_id" {
    description = "Public Subnet 01 ID"
    value = try(aws_subnet.public[0].id, "") 
}

output "public_subnet_02_id" {
    description = "Public Subnet 02 ID"
    value = try(aws_subnet.public[1].id, "") 
}

output "private_subnet_01_id" {
    description = "Private Subnet 01 ID"
    value = try(aws_subnet.private[0].id, "") 
}

output "private_subnet_02_id" {
    description = "Private Subnet 02 ID"
    value = try(aws_subnet.private[1].id, "") 
}