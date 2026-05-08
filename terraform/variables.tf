variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type        = string
    default     = "10.0.0.0/16"
}
variable "public_subnet_cidrs" {
    description = "List of CIDR blocks for public subnets"
    type        = list(string)
    default     = ["10.0.1.0/24", "10.0.4.0/24"]

    validation {
        condition     = length(var.public_subnet_cidrs) >= 2
        error_message = "At least two public subnet CIDRs (different AZs) are required for EKS."
    }
}
variable "private_subnet_cidrs" {
    description = "List of CIDR blocks for private subnets"
    type        = list(string)
    default     = ["10.0.2.0/24", "10.0.5.0/24"]

    validation {
        condition     = length(var.private_subnet_cidrs) >= 2
        error_message = "At least two private subnet CIDRs (different AZs) are required for EKS."
    }
}
variable "database_subnet_cidrs" {
    description = "List of CIDR blocks for database subnets"
    type        = list(string)
    default     = ["10.0.3.0/24"]
}
variable "eks_azs" {
    description = "List of availability zones"
    type        = list(string)
    default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "cluster_name" {
    description = "EKS cluster name"
    type        = string
    default     = "appscrip_eks_cluster"
}
variable "node_group_name" {
    description = "Managed node group name"
    type        = string
    default     = "appscrip_eks_node_group"
}
variable "node_instance_type" {
    description = "Instance type for worker nodes"
    type        = string
    default     = "t3.medium"
}
variable "desired_capacity" {
    description = "Desired node count"
    type        = number
    default     = 2
}
variable "max_capacity" {
    description = "Maximum node count"
    type        = number
    default     = 3
}
variable "min_capacity" {
    description = "Minimum node count"
    type        = number
    default     = 1
}   

variable "region" {
  description = "The AWS region to deploy the resources"
  type        = string
  default     = "us-west-2"
}