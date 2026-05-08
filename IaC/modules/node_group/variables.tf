
variable "cluster_name" {
  description = "EKS cluster name to attach the node group to"
  type        = string
}

variable "node_group_name" {
  description = "EKS node group name"
  type        = string
  default     = "appscrip-node-group"
}

variable "node_role_arn" {
  description = "IAM role ARN for worker nodes"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs where nodes will run"
  type        = list(string)
}

variable "instance_types" {
  description = "EC2 instance types for the managed node group"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "desired_size" {
  description = "Desired node count"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Max node count"
  type        = number
  default     = 3
}

variable "min_size" {
  description = "Min node count"
  type        = number
  default     = 1
}
