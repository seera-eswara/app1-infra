terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.57.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Application-specific resource group
resource "azurerm_resource_group" "app" {
  name     = "rg-app1-dev-app"
  location = "eastus"

  tags = {
    Application = "app1"
    Environment = "dev"
  }
}

module "aks" {
  source = "git::https://github.com/seera-eswara/terraform-azure-modules.git//modules/aks?ref=f94383044a37da515aa0557225aa00825f96ccf4"

  name           = "app1-dev-aks"
  location       = "eastus"
  resource_group = azurerm_resource_group.app.name

  vm_size    = "Standard_D4s_v3"
  node_count = 2

  enable_oms_agent           = true
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.baseline.id
}
