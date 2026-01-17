module "aks" {
  source = "git::ssh://git@github.com/seera-eswara/terraform-azure-modules.git//modules/aks?ref=1995a3f45ade7920e8756291a78fa32db057b4f5"

  name           = "app1-dev-aks"
  location       = "eastus"
  resource_group = "rg-app1-dev"

  vm_size    = "Standard_B2ts_v2"
  node_count = 3
}
