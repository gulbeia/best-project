variable "eks" {
  type        = string
}

variable "aws_iam_role"  {
  type        = string
 }

 variable "aws_iam_role_policy_attachment" {
  type        = string
}
 
 variable "amazon_eks_cluster_policy" {
    type      = string
 }

variable  "role_arn"   {
    type      = number
}

#variable  "eks_cluster.arn"{
 #   type      = string
#}

variable "instance_type" {
  type        = string
  default     = "t3.small"
}