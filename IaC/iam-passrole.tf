data "aws_caller_identity" "current" {}

locals {
  caller_arn = data.aws_caller_identity.current.arn
  # arn:aws:iam::<acct>:user/<name>
  caller_is_user = can(regex("arn:aws:iam::[0-9]+:user/", local.caller_arn))
  caller_user    = local.caller_is_user ? element(split("/", local.caller_arn), length(split("/", local.caller_arn)) - 1) : null
}

data "aws_iam_policy_document" "allow_passrole" {
  statement {
    sid     = "AllowPassRoleForEKS"
    effect  = "Allow"
    actions = ["iam:PassRole"]
    resources = [
      module.appscrip_iam.eks_cluster_role_arn,
      module.appscrip_iam.eks_node_role_arn,
    ]

    condition {
      test     = "StringEquals"
      variable = "iam:PassedToService"
      values = [
        "eks.amazonaws.com",
        "ec2.amazonaws.com",
      ]
    }
  }
}

resource "aws_iam_policy" "passrole" {
  name        = "appscrip-terraform-passrole"
  description = "Allow Terraform caller to PassRole for EKS"
  policy      = data.aws_iam_policy_document.allow_passrole.json
}

resource "aws_iam_user_policy_attachment" "attach_passrole_to_caller" {
  count      = var.attach_passrole_policy_to_caller_user && local.caller_is_user ? 1 : 0
  user       = local.caller_user
  policy_arn = aws_iam_policy.passrole.arn
}

output "terraform_caller_arn" {
  description = "The AWS ARN used by Terraform"
  value       = local.caller_arn
}

output "passrole_policy_arn" {
  description = "Policy ARN that grants iam:PassRole for EKS roles"
  value       = aws_iam_policy.passrole.arn
}

output "passrole_policy_json" {
  description = "If you can't attach the policy via Terraform, attach this JSON to your IAM user/role manually"
  value       = data.aws_iam_policy_document.allow_passrole.json
}

