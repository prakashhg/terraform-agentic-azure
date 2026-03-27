module "ai_foundry" {
  source  = "Azure/avm-ptn-aiml-ai-foundry/azurerm"
  version = "0.5.1"

  location                    = var.location
  resource_group_resource_id  = azurerm_resource_group.rg.id
  base_name                   = var.foundry_account_name

  ai_foundry = {
    create_ai_agent_service = true
  }

  ai_projects = {
    (var.foundry_project_name) = {
      name         = var.foundry_project_name
      display_name = var.foundry_project_name
      description  = "Agentic AI project"
    }
  }

  create_byor = true

  # BYOR for AI Search if provided
  # (The module handles BYOR via the project connections, but for simplicity, let it create)
}