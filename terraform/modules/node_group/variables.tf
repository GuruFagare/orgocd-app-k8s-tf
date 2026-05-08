variable "cluster_name" {
    description = "EKS cluster name"
    type        = string
}

variable "node_group_name" {
    description = "Managed node group name"
    type        = string
}

variable "node_role_arn" {
    description = "IAM role ARN for the worker nodes"
    type        = string
}

variable "subnet_ids" {
    description = "Subnets to place the node group in"
    type        = list(string)
}

variable "node_instance_type" {
    description = "Instance type for worker nodes"
    type        = string
}

variable "desired_capacity" {
    description = "Desired number of worker nodes"
    type        = number
}

variable "max_capacity" {
    description = "Maximum number of worker nodes"
    type        = number
}

variable "min_capacity" {
    description = "Minimum number of worker nodes"
    type        = number
}

variable "tags" {
    description = "Tags to apply to the node group"
    type        = map(string)
    default     = {}
}

