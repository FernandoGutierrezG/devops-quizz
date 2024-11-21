# network/outputs.tf
# Fernando Gutierrez
output "vpc_id" {
  value = aws_vpc.ft_vpc_dev.id
}

output "public_subnets_id" {
  value = aws_subnet.ft_public[*].id
}

output "private_subnets_ecs_id" {
  value = aws_subnet.ft_private_ecs[*].id
}
