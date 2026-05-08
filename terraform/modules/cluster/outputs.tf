output "cluster_name" {
    value       = aws_eks_cluster.this.name
    description = "Name of the EKS cluster"
}

output "cluster_endpoint" {
    value       = aws_eks_cluster.this.endpoint
    description = "EKS cluster API endpoint"
}

output "cluster_certificate_authority" {
    value       = aws_eks_cluster.this.certificate_authority[0].data
    description = "Cluster CA data (base64)"
}

