output "node_group_arn" {
    value       = aws_eks_node_group.this.arn
    description = "ARN of the managed node group"
}

output "node_group_id" {
    value       = aws_eks_node_group.this.id
    description = "ID of the managed node group"
}

