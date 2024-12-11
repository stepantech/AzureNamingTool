resource "azurerm_storage_account" "aznamingtool_stga" {
  name                     = "tspsstgaaznamingtool"
  resource_group_name      = azurerm_resource_group.aznamingtool_rg.name
  location                 = azurerm_resource_group.aznamingtool_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "aznamingtool_shr" {
  name                 = "aznamingtoolshare"
  storage_account_id   = azurerm_storage_account.aznamingtool_stga.id
  quota                = 10
}