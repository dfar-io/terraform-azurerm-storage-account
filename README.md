# Azure Storage Account Module

Terraform Module for creating Azure storage accounts.

This module requires a Resource Group to be created first for usage.

## Usage

### Create Basic Storage Account

```
resource "azurerm_resource_group" "rg" {
  name     = "RESOURCE_GROUP_NAME"
  location = "Central US"
}

module "storage-account" {
  source      = "dfar-io/storage-account/azurerm"
  name        = "STORAGE_ACCOUNT_NAME"
  rg_location = azurerm_resource_group.rg.location
  rg_name     = azurerm_resource_group.rg.name
}
```

### Create Storage Account with Containers

```
module "storage-account" {
  source      = "dfar-io/storage-account/azurerm"
  name        = "STORAGE_ACCOUNT_NAME"
  rg_location = azurerm_resource_group.rg.location
  rg_name     = azurerm_resource_group.rg.name
  containers  = [
      "container1",
      "container2"
  ]
}
```

### Create Storage Account with Static Website Enabled

```
module "storage-account" {
  source      = "dfar-io/storage-account/azurerm"
  name        = "STORAGE_ACCOUNT_NAME"
  rg_location = azurerm_resource_group.rg.location
  rg_name     = azurerm_resource_group.rg.name
  static_website = {
      index_document     = "index.html"
      error_404_document = "index.html"
  }
}
```
