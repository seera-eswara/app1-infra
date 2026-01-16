module "aks" {
  source = "git::https://github.com/your-org/terraform-azure-modules.git//modules/aks?ref=1995a3f45ade7920e8756291a78fa32db057b4f5"

  name           = "app1-stg-aks"
  location       = "eastus"
  resource_group = "rg-app1-stg"

  vm_size    = "Standard_D4s_v5"
  node_count = 3
}
