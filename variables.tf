variable "cluster_name" {
  default     = null
  description = "The name of the EKS cluster"
  type        = string
}

variable "add_eks_resources" {
  default     = true
  description = "Whether to enable EKS-related resources"
  type        = bool
}

variable "trust_arn" {
  default     = "arn:aws:iam::706124985648:role/aerith-gemini-cli"
  description = "The ARN of the IAM role to trust"
  type        = string
}
