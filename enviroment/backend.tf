terraform {
  backend "azurerm" { # Change this to "local" for local backend
    resource_group_name  = "rg-base-dev-sc-001"
    storage_account_name = "tspsterraform"
    container_name       = "tfstate"
    key                  = "azurenamingtool.tfstate"
    use_azuread_auth     = true
    subscription_id      = "7568475b-3f98-4c3f-8bbb-05e248ff70b4"
  }
}