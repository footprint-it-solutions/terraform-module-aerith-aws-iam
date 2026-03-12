resource "aws_iam_role" "eks_admin" {
  assume_role_policy = jsonencode({
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = var.trust_arn
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
        Action = [
          "eks:AccessKubernetesApi",
          "eks:DescribeAddon",
          "eks:DescribeAddonVersions",
          "eks:DescribeCluster",
          "eks:DescribeFargateProfile",
          "eks:DescribeIdentityProviderConfig",
          "eks:DescribeNodegroup",
          "eks:DescribeUpdate",
          "eks:ListAddons",
          "eks:ListClusters",
          "eks:ListFargateProfiles",
          "eks:ListIdentityProviderConfigs",
          "eks:ListNodegroups",
          "eks:ListUpdates",
        ]
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
          AWS = var.trust_arn
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
        Action = [
          "eks:AccessKubernetesApi",
          "eks:DescribeAddon",
          "eks:DescribeAddonVersions",
          "eks:DescribeCluster",
          "eks:DescribeFargateProfile",
          "eks:DescribeIdentityProviderConfig",
          "eks:DescribeNodegroup",
          "eks:DescribeUpdate",
          "eks:ListAddons",
          "eks:ListClusters",
          "eks:ListFargateProfiles",
          "eks:ListIdentityProviderConfigs",
          "eks:ListNodegroups",
          "eks:ListUpdates",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
    Version = "2012-10-17"
  })
}
