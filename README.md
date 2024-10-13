# Azure recoverable remote state Terraform module

Terraform module that creates an Azure storage account and a blob container to be used as a remote backend for Terraform state. It is recoverable thanks to soft-delete, versioning, and a resource lock to prevent accidental deletion and modifications.

# Usage

```hcl
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

variable "subscription_id" {
  description = "Azure subscription id."
  type        = string
}

resource "azurerm_resource_group" "this" {
  name     = "<my-resource-group>"
  location = "<my-location>"
}

module "backend" {
  source              = "artemious7/recoverable-remote-state/azurerm"
  application_tag     = "<my-project-name>"
  resource_group_name = azurerm_resource_group.this.name
  depends_on = [ azurerm_resource_group.this ]
}

output "storage_account_name" {
  value = module.backend.storage_account_name
}

output "container_name" {
  value = module.backend.blob_container_name
}
```
