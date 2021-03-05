machine_learning_workspaces = {
  ml_workspace_re1 = {
    name                     = "mlops"
    resource_group_key       = "azure_ml"
    keyvault_key             = "mlops_secrets"
    storage_account_key      = "ml_workspace"
    application_insights_key = "ml_app_insight"
  }
}