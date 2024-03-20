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
    # access_key           = ${{ secrets.ARM_ACCESS_KEY }}
  }
}

provider "azurerm" {
  features {}

  subscription_id = ${{ secrets.ARM_SUBSCRIPTION_ID }}
  tenant_id       = ${{ secrets.ARM_TENANT_ID }}
  client_id       = ${{ secrets.ARM_CLIENT_ID }}
  client_secret   = ${{ secrets.ARM_SECRET_ID }}
}
