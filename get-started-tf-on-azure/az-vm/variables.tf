variable "resource_group_location" {
  default     = "southeastasia"
  description = "Location of the resource group."
}

variable "prefix" {
  type        = string
  default     = "win-vm-iis"
  description = "Prefix of the resource name"
}

variable "ARM_CLIENT_ID" {
  description = "The Client ID of the Service Principal"
  type        = string
  sensitive   = true
}

variable "ARM_SUBSCRIPTION_ID" {
  description = "The Subscription ID of the Service Principal"
  type        = string
  sensitive   = true
}

variable "ARM_TENANT_ID" {
  description = "The Tenant ID of the Service Principal"
  type        = string
  sensitive   = true
}

variable "ARM_SECRET_ID" {
  description = "The secret ID of the Service Principal"
  type        = string
  sensitive   = true
}
