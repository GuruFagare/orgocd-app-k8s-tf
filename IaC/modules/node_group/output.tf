output "node_group_arn" {
  value       = aws_eks_node_group.appscrip_node_group.arn
  description = "ARN of the managed node group"
}

output "node_group_id" {
  value       = aws_eks_node_group.appscrip_node_group.id
  description = "ID of the managed node group"
}