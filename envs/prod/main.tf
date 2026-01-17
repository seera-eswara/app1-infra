module "vnet" {
  source = "git::https://github.com/seera-eswara/terraform-azure-modules.git//modules/vnet?ref=1995a3f45ade7920e8756291a78fa32db057b4f5"

  name     = "app1-vnet"
  location = "eastus"
}

module "aks" {
  source = "git::https://github.com/seera-eswara/terraform-azure-modules.git//modules/aks?ref=1995a3f45ade7920e8756291a78fa32db057b4f5"

  private_cluster = true
  sku_tier        = "Standard"
}
