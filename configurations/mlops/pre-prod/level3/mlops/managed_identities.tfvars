managed_identities = {
  appsvc_keyvault_secrets = {
    name               = "appsvc-secrets-msi"
    resource_group_key = "azure_ml"
  }
  fnapp_keyvault_secrets = {
    name               = "fnapp-secrets-msi"
    resource_group_key = "azure_ml"
  }
  mlwrksp_keyvault_secrets = {
    name               = "mlwrksp-secrets-msi"
    resource_group_key = "azure_ml"
  }
}