terraform {
  required_version = ">= 1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

# The "naming" module ensures unique Azure Cloud Adoption Framework-compliant names for the resources.
module "naming" {
  source = "Azure/naming/azurerm"
  suffix = [var.name_suffix]
}