resource "aws_eks_cluster" "appscrip_eks_cluster" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn
  version  = var.cluster_version

  vpc_config {
    subnet_ids              = var.subnet_ids
    endpoint_public_access  = true
    endpoint_private_access = false
  }

  tags = {
    Name = var.cluster_name
  }
}
