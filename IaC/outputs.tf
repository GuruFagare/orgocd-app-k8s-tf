output "cluster_name" {
  value       = module.appscrip_eks.cluster_name
  description = "EKS cluster name"
}

output "cluster_endpoint" {
  value       = module.appscrip_eks.cluster_endpoint
  description = "EKS cluster endpoint"
}

output "cluster_certificate_authority_data" {
  value       = module.appscrip_eks.cluster_certificate_authority
  description = "Base64 encoded cluster CA data"
}

output "kubeconfig_update_command" {
  description = "Command to write kubeconfig after apply"
  value       = "aws eks update-kubeconfig --name ${module.appscrip_eks.cluster_name} --region ${var.aws_region} --profile ${var.aws_profile}"
}

