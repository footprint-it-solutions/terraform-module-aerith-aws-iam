# Terraform Module Aerith AWS IAM

This module creates IAM roles and EKS access entries for Aerith.

## Resources

- `aerith-eks-admin` IAM Role
- `aerith-eks-admin-view` IAM Role
- EKS Access Entry and Policy Association for `AmazonEKSClusterAdminPolicy`
- EKS Access Entry and Policy Association for `AmazonEKSAdminViewPolicy`

## Usage

```hcl
module "aerith_iam" {
  source = "github.com/footprint-it-solutions/terraform-module-aerith-aws-iam//?ref=main"

  cluster_name = "my-cluster"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster_name | The name of the EKS cluster | `string` | n/a | yes |
| trust_arn | The ARN of the IAM role to trust | `string` | `"arn:aws:iam::203918840229:role/aerith-gemini-cli"` | no |
