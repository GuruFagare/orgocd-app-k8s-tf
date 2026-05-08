module "appscrip_vpc" {
  source = "./modules/vpc"

  vpc_cidr            = var.vpc_cidr_block
  public_subnet_cidrs = var.appscrip_public_subnet_cidrs
  public_subnet_azs   = var.public_subnet_azs
  cluster_name        = var.cluster_name
}

module "appscrip_iam" {
  source = "./modules/iam"
}

module "appscrip_eks" {
  source = "./modules/eks"

  cluster_name     = var.cluster_name
  cluster_version  = var.cluster_version
  cluster_role_arn = module.appscrip_iam.eks_cluster_role_arn
  subnet_ids       = module.appscrip_vpc.public_subnet_ids
}

module "appscrip_node_group" {
  source = "./modules/node_group"

  cluster_name    = module.appscrip_eks.cluster_name
  node_group_name = "appscrip-node-group"
  node_role_arn   = module.appscrip_iam.eks_node_role_arn
  subnet_ids      = module.appscrip_vpc.public_subnet_ids
  instance_types  = ["t3.medium"]
  desired_size    = 2
  max_size        = 3
  min_size        = 1
}
