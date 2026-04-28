resource "aws_eks_access_entry" "eks_admin" {
  cluster_name  = var.cluster_name
  principal_arn = aws_iam_role.admin.arn
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "eks_admin" {
  access_scope {
    type = "cluster"
  }
  cluster_name  = var.cluster_name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = aws_iam_role.admin.arn
}

resource "aws_eks_access_entry" "eks_admin_view" {
  cluster_name  = var.cluster_name
  principal_arn = aws_iam_role.read_only.arn
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "eks_admin_view" {
  access_scope {
    type = "cluster"
  }
  cluster_name  = var.cluster_name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSAdminViewPolicy"
  principal_arn = aws_iam_role.read_only.arn
}
