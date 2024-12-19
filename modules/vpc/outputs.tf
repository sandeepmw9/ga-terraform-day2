output "vpc_id" {
  value = aws_vpc.my_vpc_161224.id
}

output "public_sub_id" {
  value = aws_subnet.pub_sub1.id
}

output "private_sub_id" {
  value = aws_subnet.priv_sub1.id
}