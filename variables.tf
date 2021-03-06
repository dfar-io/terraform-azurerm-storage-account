// Required
variable "name" {
  description = "Storage account name."
}
variable "rg_name" {
  description = "Existing resource group name for storage account to be placed in."
}
variable "rg_location" {
  description = "Existing resource group location for storage account to be placed in."
}

// Optional

// If possible, allow for entering only one map value
variable "static_website" {
  description = "Static website configuration block."
  type = object({
    index_document     = string
    error_404_document = string
  })
  default = {
    index_document     = null
    error_404_document = null
  }
}

variable "containers" {
  description = "List of containers to create with storage account."
  type = list(object({
    name = string
    container_access_type = string
  }))
  default = []
}

variable "allow_blob_public_access" {
  description = "Allow or disallow public access to all blobs or containers in the storage account."
  type = bool
  default = false
}