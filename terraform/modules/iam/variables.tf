variable "name_prefix" {
    description = "Base prefix for IAM role names (used when role names are auto-generated)"
    type        = string
    default     = "appscrip-eks"
}

variable "cluster_role_name" {
    description = "Explicit IAM role name for the EKS control plane (leave null to auto-generate)"
    type        = string
    default     = null
}

variable "node_role_name" {
    description = "Explicit IAM role name for the EKS worker nodes (leave null to auto-generate)"
    type        = string
    default     = null
}

