module "vnet" {
  source = "git::https://github.com/org/terraform-azure-modules.git//modules/vnet?ref=v1.2.0"

  name     = "app1-vnet"
  location = "eastus"
}

module "aks" {
  source = "git::https://github.com/org/terraform-azure-modules.git//modules/aks?ref=v1.4.0"

  private_cluster = true
  sku_tier        = "Standard"
}
