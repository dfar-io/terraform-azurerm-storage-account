resource "azurerm_storage_account" "sa" {
  name                     = var.name
  resource_group_name      = var.rg_name
  location                 = var.rg_location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  allow_blob_public_access = var.allow_blob_public_access

  dynamic "static_website" {
    for_each = var.static_website.index_document == null && var.static_website.error_404_document == null ? [] : list(var.static_website)

    content {
      index_document     = static_website.value.index_document
      error_404_document = static_website.value.error_404_document
    }
  }
}

resource "azurerm_storage_container" "container" {
  count                 = length(var.containers)
  name                  = element(var.containers, count.index).name
  storage_account_name  = var.name
  container_access_type = element(var.containers, count.index).container_access_type

  depends_on = [
    azurerm_storage_account.sa
  ]
}