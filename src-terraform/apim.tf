resource "azurerm_api_management" "apim" {
  name                = var.apim_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  publisher_name      = "pub"
  publisher_email     = "pub@example.com"
  sku_name            = "Developer_1"
}

# DevCoPilot API (backed by Foundry agent endpoint; routed via policy)
resource "azurerm_api_management_api" "devcopilot" {
  name                = "devcopilot"
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "DevCoPilot"
  path                = "devcopilot"
  protocols           = ["https"]
}

# Apply a JWT validation policy that also sets the backend at runtime
resource "azurerm_api_management_api_policy" "devcopilot_policy" {
  api_name            = azurerm_api_management_api.devcopilot.name
  api_management_name = azurerm_api_management.apim.name
  resource_group_name = azurerm_resource_group.rg.name

  xml_content = templatefile("${path.module}/../modules/apim-policy-templates/validate-jwt.xml.tftpl", {
    tenant_id   = var.tenant_id
    audience    = var.jwt_audience
    backend_url = var.devcopilot_backend_url
  })
}

# ITOps API
resource "azurerm_api_management_api" "itops" {
  name                = "itops"
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "ITOps Agent"
  path                = "itops"
  protocols           = ["https"]
}

resource "azurerm_api_management_api_policy" "itops_policy" {
  api_name            = azurerm_api_management_api.itops.name
  api_management_name = azurerm_api_management.apim.name
  resource_group_name = azurerm_resource_group.rg.name

  xml_content = templatefile("${path.module}/../modules/apim-policy-templates/validate-jwt.xml.tftpl", {
    tenant_id   = var.tenant_id
    audience    = var.jwt_audience
    backend_url = var.itops_backend_url
  })
}