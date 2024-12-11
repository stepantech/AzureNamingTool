terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4" # nebo aktuální stabilní verze
    }
  }
}

provider "azurerm" {
  subscription_id = "7568475b-3f98-4c3f-8bbb-05e248ff70b4"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
