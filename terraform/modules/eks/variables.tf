variable "name" {
  description = "Base name for resources"
  type        = string
  default     = "appscrip_eks"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "my-eks"
}

variable "node_group_name" {
  description = "EKS node group name"
  type        = string
  default     = "my-eks-ng"
}

variable "node_instance_type" {
  description = "Node instance type"
  type        = string
  default     = "t3.medium"
}

variable "desired_capacity" {
  type    = number
  default = 1
}

variable "max_capacity" {
  type    = number
  default = 2
}

variable "min_capacity" {
  type    = number
  default = 1
}

variable "tags" {
  type    = map(string)
  default = { Environment = "dev" }
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}