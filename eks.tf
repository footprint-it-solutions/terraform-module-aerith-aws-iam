resource "aws_eks_access_entry" "admin" {
  cluster_name  = var.cluster_name
  principal_arn = aws_iam_role.admin.arn
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "cluster_admin" {
  access_scope {
    type = "cluster"
  }
  cluster_name  = var.cluster_name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = aws_iam_role.admin.arn
}

resource "aws_eks_access_entry" "read_only" {
  cluster_name  = var.cluster_name
  principal_arn = aws_iam_role.read_only.arn
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "admin_view" {
  access_scope {
    type = "cluster"
  }
  cluster_name  = var.cluster_name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSAdminViewPolicy"
  principal_arn = aws_iam_role.read_only.arn
}
