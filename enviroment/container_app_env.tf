resource "azurerm_container_app_environment" "aznamingtool_env" {
  name                = "azcenv-azurenamingtool-prod-sc-001"
  resource_group_name = azurerm_resource_group.aznamingtool_rg.name
  location            = azurerm_resource_group.aznamingtool_rg.location
  log_analytics_workspace_id = azurerm_log_analytics_workspace.aznamingtool_law.id
}

resource "azurerm_container_app_environment_storage" "aznamingtool_env_stg" {
  name                         = azurerm_storage_share.aznamingtool_shr.name
  container_app_environment_id = azurerm_container_app_environment.aznamingtool_env.id
  account_name                 = azurerm_storage_account.aznamingtool_stga.name
  share_name                   = azurerm_storage_share.aznamingtool_shr.name
  access_key                   = azurerm_storage_account.aznamingtool_stga.primary_access_key
  access_mode                  = "ReadWrite"
}