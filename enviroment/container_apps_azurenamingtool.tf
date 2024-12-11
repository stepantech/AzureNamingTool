# Získání přístupového klíče k úložišti
/* data "azurerm_storage_account" "aznamingtool_stga_data" {
  name                = azurerm_storage_account.aznamingtool_stga.name
  resource_group_name = azurerm_resource_group.aznamingtool_rg.name
}

output "storage_account_key" {
  value = data.azurerm_storage_account.aznamingtool_stga_data.primary_access_key
} */

resource "azurerm_container_app" "aznamingtool_app" {
  name                = "azurenamingtool"
  container_app_environment_id = azurerm_container_app_environment.aznamingtool_env.id
  resource_group_name = azurerm_resource_group.aznamingtool_rg.name
  revision_mode       = "Single"
  ingress {
    traffic_weight {
        latest_revision = true
        percentage = 100
    }
    external_enabled = true
    target_port      = 80
  }
/*   secret {
    name  = "registry-credentials"
    value = azurerm_container_registry.aznamingtool_acr.admin_password
  }

  registry {
    server               = azurerm_container_registry.aznamingtool_acr.login_server
    username             = azurerm_container_registry.aznamingtool_acr.admin_username
    password_secret_name = "registry-credentials" # secret mentioned in above block
  }  */
  template {
    max_replicas = 1
    min_replicas = 0
    
    volume {
      name = azurerm_container_app_environment_storage.aznamingtool_env_stg.name
      storage_type = "AzureFile"
      storage_name = azurerm_container_app_environment_storage.aznamingtool_env_stg.name
    }

    container {
      name   = "azure-naming-tool"
      #image  = "aznamingtool:latest" # Docker image aplikace
      image  = "hmizael/azurenamingtool:v4.3.0"

      # Mount Azure Files
      volume_mounts {
        name      = azurerm_container_app_environment_storage.aznamingtool_env_stg.name
        path = "/app/settings"
      }

      cpu    = 0.5
      memory = "1.0Gi"
    }
  }
}