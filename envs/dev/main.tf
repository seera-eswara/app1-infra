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

resource "azurerm_resource_group" "this" {
  name     = "rg-app1-dev"
  location = "eastus"
}

resource "azurerm_log_analytics_workspace" "this" {
  name                = "law-app1-dev"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.this.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

module "aks" {
  source = "git::https://github.com/seera-eswara/terraform-azure-modules.git//modules/aks?ref=f94383044a37da515aa0557225aa00825f96ccf4"

  name           = "app1-dev-aks"
  location       = "eastus"
  resource_group = azurerm_resource_group.this.name

  vm_size    = "Standard_B2ts_v2"
  node_count = 3

  enable_oms_agent           = true
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id
}
