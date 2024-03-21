variable "resource_group_location" {
  type        = string
  default     = "southeastasia"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
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
