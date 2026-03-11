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
