# Terraform Module Aerith AWS IAM

This module creates IAM roles and optionally EKS access entries for Aerith.

## Resources

- `aerith-admin` IAM Role
- `aerith-read-only` IAM Role
- EKS Access Entry and Policy Association for `AmazonEKSClusterAdminPolicy` (Optional)
- EKS Access Entry and Policy Association for `AmazonEKSAdminViewPolicy` (Optional)

## Usage

### With EKS (Default)

```hcl
module "aerith_iam" {
  source = "github.com/footprint-it-solutions/terraform-module-aerith-aws-iam//?ref=main"

  cluster_name = "my-cluster"
}
```

### Without EKS

```hcl
module "aerith_iam" {
  source = "github.com/footprint-it-solutions/terraform-module-aerith-aws-iam//?ref=main"

  add_eks_resources = false
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster_name | The name of the EKS cluster. Required if `add_eks_resources` is `true`. | `string` | `null` | no |
| add_eks_resources | Whether to enable EKS-related resources. | `bool` | `true` | no |
| trust_arn | The ARN of the IAM role to trust | `string` | `"arn:aws:iam::706124985648:role/aerith-gemini-cli"` | no |
