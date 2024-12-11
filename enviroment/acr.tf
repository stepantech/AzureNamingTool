resource "azurerm_container_registry" "aznamingtool_acr" {
  name                = "tspsaznamingtool"
  resource_group_name = azurerm_resource_group.aznamingtool_rg.name
  location            = azurerm_resource_group.aznamingtool_rg.location
  sku                 = "Basic"
  admin_enabled       = true
}