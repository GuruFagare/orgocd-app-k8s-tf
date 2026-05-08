variable "iam_role_name" {
  description = "IAM role name for the EKS control plane"
  type        = string
  default     = "appscrip-eks-role"
}

variable "node_role_name" {
  description = "IAM role name for EKS worker nodes"
  type        = string
  default     = "appscrip-node-role"
}

variable "eks_cluster_policy" {
  description = "Managed policy that gives EKS control plane permissions"
  type        = string
  default     = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

variable "eks_worker_node_policy" {
  description = "Managed policy that gives nodes permissions to join the cluster"
  type        = string
  default     = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

variable "eks_cni_policy" {
  description = "Managed policy for the AWS VPC CNI plugin"
  type        = string
  default     = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

variable "ec2_container_policy" {
  description = "Managed policy that lets nodes pull images from ECR"
  type        = string
  default     = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}
