resource "azurerm_log_analytics_workspace" "aznamingtool_law" {
  name                = "law-azurenamingtool-prod-sc-001"
  resource_group_name = azurerm_resource_group.aznamingtool_rg.name
  location            = azurerm_resource_group.aznamingtool_rg.location
  sku                 = "PerGB2018"
  retention_in_days   = 30
}