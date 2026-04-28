resource "aws_iam_role" "admin" {
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
  name = "aerith-admin"
}

resource "aws_iam_role_policy" "admin" {
  name = "aerith-admin"
  role = aws_iam_role.admin.id

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

resource "aws_iam_role_policy_attachment" "admin" {
  role       = aws_iam_role.admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_role" "read_only" {
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
  name = aerith-read-only"
}

resource "aws_iam_role_policy" "read_only" {
  name = "aerith-read-only"
  role = aws_iam_role.read_only.id

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

resource "aws_iam_role_policy_attachment" "read_only" {
  role       = aws_iam_role.read_only.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
