output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.appscrip_vpc.id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = aws_subnet.appscrip_public[*].id
}
