output "storage_account_name" {
  description = "Created storage account name."
  value = azurerm_storage_account.this.name
}

output "blob_container_name" {
  description = "Created blob storage container name."
  value = azurerm_storage_container.this.name
}