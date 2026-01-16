module "aks" {
  source = "git::https://github.com/your-org/terraform-azure-modules.git//modules/aks?ref=v1.1.0"

  name           = "app1-stg-aks"
  location       = "eastus"
  resource_group = "rg-app1-stg"

  vm_size    = "Standard_D4s_v5"
  node_count = 3
}
