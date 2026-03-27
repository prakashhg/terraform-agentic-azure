resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

# GitHub OIDC App (no client secret needed for Actions)
resource "azuread_application" "gh_oidc_app" {
  display_name = "gh-oidc-${var.gh_org}-${var.gh_repo}"
}

resource "azuread_service_principal" "gh_oidc_sp" {
  client_id = azuread_application.gh_oidc_app.client_id
}

# Federated Creds for PRs and branch runs (subject + audience api://AzureADTokenExchange)
resource "azuread_application_federated_identity_credential" "gh_branch" {
  application_object_id = azuread_application.gh_oidc_app.object_id
  display_name          = "github-branch-${var.gh_branch}"
  audiences             = ["api://AzureADTokenExchange"]
  issuer                = "https://token.actions.githubusercontent.com"
  subject               = "repo:${var.gh_org}/${var.gh_repo}:ref:refs/heads/${var.gh_branch}"
}

resource "azuread_application_federated_identity_credential" "gh_pr" {
  application_object_id = azuread_application.gh_oidc_app.object_id
  display_name          = "github-pr"
  audiences             = ["api://AzureADTokenExchange"]
  issuer                = "https://token.actions.githubusercontent.com"
  subject               = "repo:${var.gh_org}/${var.gh_repo}:pull_request"
}