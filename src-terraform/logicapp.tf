# Logic App (Consumption) to create ServiceNow incidents via connector
# resource "azurerm_logic_app_workflow" "snow_tool" {
#   name                = var.logicapp_name
#   location            = var.location
#   resource_group_name = azurerm_resource_group.rg.name
#   enabled             = true

#   definition = <<DEFINITION
# {
#   "$schema": "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#",
#   "contentVersion": "1.0.0.0",
#   "parameters": {},
#   "triggers": {
#     "manual": {
#       "type": "Request",
#       "kind": "Http",
#       "inputs": {
#         "schema": {
#           "type": "object",
#           "properties": {
#             "Description": { "type": "string" },
#             "Severity": { "type": "string" }
#           }
#         }
#       }
#     }
#   },
#   "actions": {
#     "Create_Incident": {
#       "type": "Http",
#       "inputs": {
#         "method": "POST",
#         "uri": "https://example.com/api/incident",
#         "body": {
#           "short_description": "@triggerBody()?['Description']",
#           "severity": "@triggerBody()?['Severity']"
#         }
#       },
#       "runAfter": {}
#     }
#   },
#   "outputs": {}
# }
# DEFINITION
# }

# Optional: declare the API connection resource shell (auth is granted post-deploy)
resource "azurerm_api_connection" "servicenow_conn" {
  name                = "service-now"
  resource_group_name = azurerm_resource_group.rg.name
  managed_api_id      = "/subscriptions/${var.subscription_id}/providers/Microsoft.Web/locations/${var.location}/managedApis/service-now"
  display_name        = "ServiceNow"
  parameter_values    = {} # authorization completed interactively in Portal
}