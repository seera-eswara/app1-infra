# Reference subscription factory outputs
data "terraform_remote_state" "subscription" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "tfstatelzqiaypb"
    container_name       = "tfstate"
    key                  = "subscription-factory/app1-prod.tfstate"
  }
}

# Reference the baseline resource group created by subscription factory
data "azurerm_resource_group" "baseline" {
  name = data.terraform_remote_state.subscription.outputs.resource_group_name
}

# Reference the log analytics workspace created by subscription factory
data "azurerm_log_analytics_workspace" "baseline" {
  name                = data.terraform_remote_state.subscription.outputs.log_analytics_workspace_name
  resource_group_name = data.azurerm_resource_group.baseline.name
}
