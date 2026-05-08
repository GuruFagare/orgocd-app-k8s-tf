output "cluster_role_arn" {
    value       = aws_iam_role.eks_cluster_role.arn
    description = "IAM role ARN for the EKS control plane"
}

output "node_role_arn" {
    value       = aws_iam_role.eks_node_role.arn
    description = "IAM role ARN for the EKS worker nodes"
}

