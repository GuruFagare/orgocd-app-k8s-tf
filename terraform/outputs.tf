output "vpc_id" {
    value       = module.appscrip_vpc.vpc_id
    description = "VPC ID created by the VPC module"
}

output "public_subnet_ids" {
    value       = module.appscrip_vpc.public_subnet_ids
    description = "Public subnet IDs"
}

output "private_subnet_ids" {
    value       = module.appscrip_vpc.private_subnet_ids
    description = "Private subnet IDs"
}

output "cluster_name" {
    value       = module.appscrip_eks.cluster_name
    description = "EKS cluster name"
}

output "cluster_endpoint" {
    value       = module.appscrip_eks.cluster_endpoint
    description = "EKS cluster API server endpoint"
}

output "cluster_certificate_authority" {
    value       = module.appscrip_eks.cluster_certificate_authority
    description = "Cluster certificate authority data"
}

output "node_group_id" {
    value       = module.appscrip_eks_node_group.node_group_id
    description = "Managed node group ID"
}

output "node_group_arn" {
    value       = module.appscrip_eks_node_group.node_group_arn
    description = "Managed node group ARN"
}