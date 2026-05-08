variable "cluster_name" {
    description = "EKS cluster name"
    type        = string
}

variable "cluster_role_arn" {
    description = "IAM role ARN for the EKS control plane"
    type        = string
}

variable "subnet_ids" {
    description = "Subnet IDs used by the control plane"
    type        = list(string)
}

variable "tags" {
    description = "Tags to apply to the EKS cluster"
    type        = map(string)
    default     = {}
}

