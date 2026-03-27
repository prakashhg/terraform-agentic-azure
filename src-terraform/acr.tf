locals {
  use_acr = var.acr_name != ""
}

resource "azurerm_container_registry" "acr" {
  count               = local.use_acr ? 1 : 0
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = false
}