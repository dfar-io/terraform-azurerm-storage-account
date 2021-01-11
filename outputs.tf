output "primary_connection_string" {
  description = "Primary Storage Account connection string."
  value       = azurerm_storage_account.sa.primary_connection_string
}

output "primary_access_key" {
  description = "Primary Storage Account key."
  value       = azurerm_storage_account.sa.primary_access_key
}
