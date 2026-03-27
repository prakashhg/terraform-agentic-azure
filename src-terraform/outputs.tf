output "gh_oidc_client_id"  { value = azuread_application.gh_oidc_app.client_id }
output "tenant_id"          { value = var.tenant_id }
output "apim_gateway"       { value = azurerm_api_management.apim.gateway_url }
output "logicapp_callback_url_hint" {
  value = "Authorize the 'service-now' connection, then copy the HTTP trigger callback URL from the Logic App designer."
}
