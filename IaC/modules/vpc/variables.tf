variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets (one per AZ)"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnet_azs" {
  description = "Availability Zones for the public subnets (must align with public_subnet_cidrs)"
  type        = list(string)
}

variable "cluster_name" {
  description = "EKS cluster name (used to tag subnets so EKS can place LoadBalancers in them)"
  type        = string
}
