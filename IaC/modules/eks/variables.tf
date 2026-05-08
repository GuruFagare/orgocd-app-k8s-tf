variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "appscrip-eks-cluster"
}

variable "cluster_role_arn" {
  description = "IAM role ARN for the EKS control plane"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the EKS control plane (must be in at least 2 AZs)"
  type        = list(string)
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.30"
}
