variable "name" {
    description = "Base name tag for the VPC resources"
    type        = string
}

variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type        = string
}

variable "azs" {
    description = "Availability zones to spread subnets across"
    type        = list(string)
}

variable "public_subnet_cidrs" {
    description = "CIDR blocks for public subnets"
    type        = list(string)
}

variable "private_subnet_cidrs" {
    description = "CIDR blocks for private subnets"
    type        = list(string)
}

variable "database_subnet_cidrs" {
    description = "CIDR blocks for database subnets"
    type        = list(string)
    default     = []
}

variable "tags" {
    description = "Common tags to propagate to resources"
    type        = map(string)
    default     = {}
}

