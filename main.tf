locals {
  default_tags = {
    environment = var.environment
  }
  assigned_tags = merge(local.default_tags, var.tags)
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}


resource "azurerm_key_vault" "kv" {
  name                        = var.kv_name
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days 
  purge_protection_enabled    = false
  sku_name = "standard"
  tags     = local.assigned_tags
}