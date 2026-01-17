terraform {
  required_version = ">= 1.6.6"
  backend "azurerm" {
    resource_group_name  = "rg-tf-state"
    storage_account_name = "tfstatelzqiaypb"
    container_name       = "tfstate"
    key                  = "app1/${var.environment}.tfstate"
  }
}
