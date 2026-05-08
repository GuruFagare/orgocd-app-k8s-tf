resource "aws_iam_role" "appscrip_eks_role" {
  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = var.iam_role_name
  }
}

resource "aws_iam_role_policy_attachment" "appscrip_eks_cluster_policy" {
  role       = aws_iam_role.appscrip_eks_role.name
  policy_arn = var.eks_cluster_policy
}

resource "aws_iam_role_policy_attachment" "appscrip_eks_vpc_resource_controller" {
  role       = aws_iam_role.appscrip_eks_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
}

resource "aws_iam_role" "appscrip_node_role" {
  name = var.node_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = var.node_role_name
  }
}

resource "aws_iam_role_policy_attachment" "appscrip_node_worker_policy" {
  role       = aws_iam_role.appscrip_node_role.name
  policy_arn = var.eks_worker_node_policy
}

resource "aws_iam_role_policy_attachment" "appscrip_node_cni_policy" {
  role       = aws_iam_role.appscrip_node_role.name
  policy_arn = var.eks_cni_policy
}

resource "aws_iam_role_policy_attachment" "appscrip_node_ecr_readonly" {
  role       = aws_iam_role.appscrip_node_role.name
  policy_arn = var.ec2_container_policy
}
