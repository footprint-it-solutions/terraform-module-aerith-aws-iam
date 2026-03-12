variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "trust_arn" {
  default     = "arn:aws:iam::203918840229:role/aerith-gemini-cli"
  description = "The ARN of the IAM role to trust"
  type        = string
}
