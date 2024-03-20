terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "acsdemotfstatefile"
    container_name       = "acsdemotfstatecontainer"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

  # subscription_id = var.ARM_SUBSCRIPTION_ID
  # tenant_id       = var.ARM_TENANT_ID
  # client_id       = var.ARM_CLIENT_ID
  # client_secret   = var.ARM_SECRET_ID
}
