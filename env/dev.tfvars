subscription_id        = "<your-subscription-guid>"
tenant_id              = "<your-tenant-guid>"
location               = "eastus"
rg_name                = "rg-agentic-dev"

foundry_account_name   = "af-dev"
foundry_project_name   = "proj-agentic-dev"
existing_ai_search_id  = ""  # or /subscriptions/.../Microsoft.Search/searchServices/...

apim_name              = "apim-agentic-dev"
jwt_audience           = "api://your-agent-api"

logicapp_name          = "la-servicenow-tool"
acr_name               = ""  # e.g., "acragenticdev" if you want ACR

gh_org                 = "your-gh-org"
gh_repo                = "terraform-agentic-azure"
gh_branch              = "main"

# Update these with the real Hosted Agent endpoints after you publish agents in Foundry
devcopilot_backend_url = "https://FOUNDARY-HOSTED/devcopilot"
itops_backend_url      = "https://FOUNDARY-HOSTED/itops"