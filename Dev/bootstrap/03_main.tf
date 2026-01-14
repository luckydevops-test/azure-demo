resource "azurerm_resource_group" "fcbresourcegroup" {
  name     = "fcb_alz_resource-group"
  location = "Poland Central"
}

resource "azurerm_storage_account" "storage" {
  name                     = "stgr101"
  location                 = azurerm_resource_group.fcbresourcegroup.location
  resource_group_name      = azurerm_resource_group.fcbresourcegroup.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}
