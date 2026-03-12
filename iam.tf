data "aws_caller_identity" "current" {}

locals {
  trust_arn = var.trust_arn != null ? var.trust_arn : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/aerith-gemini-cli"
}

resource "aws_iam_role" "eks_admin" {
  assume_role_policy = jsonencode({
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = local.trust_arn
        }
      },
    ]
    Version = "2012-10-17"
  })
  name = "aerith-eks-admin"
}

resource "aws_iam_role_policy" "eks_admin" {
  name = "eks-admin"
  role = aws_iam_role.eks_admin.id

  policy = jsonencode({
    Statement = [
      {
        Action   = ["eks:DescribeCluster"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role" "eks_admin_view" {
  assume_role_policy = jsonencode({
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = local.trust_arn
        }
      },
    ]
    Version = "2012-10-17"
  })
  name = "aerith-eks-admin-view"
}

resource "aws_iam_role_policy" "eks_admin_view" {
  name = "eks-admin-view"
  role = aws_iam_role.eks_admin_view.id

  policy = jsonencode({
    Statement = [
      {
        Action   = ["eks:DescribeCluster"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role" "gemini_cli" {
  assume_role_policy = jsonencode({
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
      },
    ]
    Version = "2012-10-17"
  })
  name = "aerith-gemini-cli"
}

resource "aws_iam_role_policy" "gemini_cli" {
  name = "gemini-cli"
  role = aws_iam_role.gemini_cli.id

  policy = jsonencode({
    Statement = [
      {
        Action = [
          "eks:DescribeCluster",
          "eks:ListClusters",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Resource = [
          aws_iam_role.eks_admin.arn,
          aws_iam_role.eks_admin_view.arn,
        ]
      },
    ]
    Version = "2012-10-17"
  })
}
