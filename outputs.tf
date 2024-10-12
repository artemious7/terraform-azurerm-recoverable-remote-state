output "storage_account_name" {
  description = "Created storage account name. Should be set to the 'storage_account_name' argument of the 'backend' block."
  value = azurerm_storage_account.this.name
}

output "blob_container_name" {
  description = "Created blob storage container name. Should be set to the 'container_name' argument of the 'backend' block."
  value = azurerm_storage_container.this.name
}

output "blob_name" {
  description = "Blob name of the Terraform state file. The convention is to use the .tfstate extension. Should be set to the 'key' argument of the 'backend' block."
  value = var.blob_name
}