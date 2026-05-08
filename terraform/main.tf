module "appscrip_vpc" {
    source = "./modules/vpc"

    name                  = "appscrip_eks_vpc"
    vpc_cidr              = var.vpc_cidr
    azs                   = var.eks_azs
    public_subnet_cidrs   = var.public_subnet_cidrs
    private_subnet_cidrs  = var.private_subnet_cidrs
    database_subnet_cidrs = var.database_subnet_cidrs

    tags = {
        Name = "appscrip_eks_vpc"
    }
}

module "appscrip_iam" {
    source = "./modules/iam"
}

module "appscrip_eks" {
    source = "./modules/cluster"

    cluster_name     = var.cluster_name
    cluster_role_arn = module.appscrip_iam.cluster_role_arn
    subnet_ids       = concat(module.appscrip_vpc.public_subnet_ids, module.appscrip_vpc.private_subnet_ids)

    tags = {
        Name = "appscrip_eks"
    }
}

module "appscrip_eks_node_group" {
    source = "./modules/node_group"

    cluster_name       = module.appscrip_eks.cluster_name
    node_group_name    = var.node_group_name
    node_role_arn      = module.appscrip_iam.node_role_arn
    subnet_ids         = module.appscrip_vpc.public_subnet_ids
    node_instance_type = var.node_instance_type
    desired_capacity   = var.desired_capacity
    max_capacity       = var.max_capacity
    min_capacity       = var.min_capacity

    tags = {
        Name = "appscrip_eks_nodes"
    }
}
