variable "subscription_id" {
  type = string
}
variable "location" {
  type    = string
  default = "eastus"
}
variable "rg_name" {
  type = string
}

# Foundry (you already have AOAI/AIS; you can BYO or let the module create)
variable "foundry_account_name" {
  type = string
}
variable "foundry_project_name" {
  type = string
}

# If you want to BYO existing Azure AI Search, pass its resource ID here
variable "existing_ai_search_id" {
  type        = string
  default     = ""
  description = "If set, Foundry connections will use this AI Search service (BYOR)."
}

# APIM + JWT
variable "apim_name" {
  type = string
}
variable "jwt_audience" {
  type        = string
  description = "Application ID URI (aud), e.g., api://your-agent-api"
}
variable "tenant_id" {
  type = string
}

# GitHub OIDC settings (for federated credential)
variable "gh_org" {
  type = string
}
variable "gh_repo" {
  type = string
}
variable "gh_branch" {
  type    = string
  default = "main"
}

# Logic App
variable "logicapp_name" {
  type = string
}

# ACR (optional)
variable "acr_name" {
  type    = string
  default = ""
}

# Backend URLs for APIM routing (once Foundry Hosted Agents are published)
variable "devcopilot_backend_url" {
  type    = string
  default = "https://placeholder-devcopilot"
}
variable "itops_backend_url" {
  type    = string
  default = "https://placeholder-itops"
}