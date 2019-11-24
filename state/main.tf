resource "azurerm_resource_group" "rgState" { 
    name = var.rg_name
    location = var.location
    tags = var.tags
} 

resource "azurerm_storage_account" "test" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rgState.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

resource "azurerm_storage_container" "test" {
  name                  = var.container_name
  resource_group_name   = azurerm_resource_group.rgState.name
  storage_account_name  = azurerm_storage_account.test.name
  container_access_type = "private"
}