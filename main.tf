locals {
  storage_account_name = module.naming.storage_account.name_unique
  container_name = module.naming.storage_container.name
}

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "this" {
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  name                = local.storage_account_name

  access_tier                     = "Hot"
  account_kind                    = "StorageV2"
  account_replication_type        = "GRS"
  account_tier                    = "Standard"
  allow_nested_items_to_be_public = false
  https_traffic_only_enabled      = true
  min_tls_version                 = "TLS1_2"

  tags = {
    Application = var.application_tag
    Purpose     = "Terraform state files"
  }

  blob_properties {
    versioning_enabled = true
    container_delete_retention_policy {
      days = 7
    }
    delete_retention_policy {
      days = 7
    }
  }

  share_properties {
    retention_policy {
      days = 7
    }
  }
}

resource "azurerm_storage_container" "this" {
  storage_account_name = azurerm_storage_account.this.name
  name = local.container_name
}