variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "app_name" {
  description = "Name of the application, used for resource naming"
  type        = string
  default     = "legacy-builder"
}

variable "domain_name" {
  description = "Domain name for the website"
  type        = string
  default     = "leagacybuilder.dev"
}