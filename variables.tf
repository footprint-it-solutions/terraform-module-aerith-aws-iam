variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "trust_arn" {
  default     = null
  description = "The ARN of the IAM role to trust"
  type        = string
}
