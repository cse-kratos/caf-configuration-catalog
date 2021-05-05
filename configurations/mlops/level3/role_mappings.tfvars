# ACR Pull Role Assignment Scoped -> App Service Resource
role_mapping = {
  built_in_role_mapping = {
    azure_container_registries = {
      mlops_acr = {
        "AcrPull" = {
          managed_identities = {
            keys   = ["appsvc_keyvault_secrets", "fnapp_keyvault_secrets", "mlwrksp_keyvault_secrets"]
          }
        }
      }
    }
    app_config = {
      mlops_config = {
        "App Configuration Data Reader" = {
          managed_identities = {
            keys   = ["appsvc_keyvault_secrets", "fnapp_keyvault_secrets"]
          }
          machine_learning_workspaces = {
            keys = ["ml_workspace_re1"]
          }
        }
      }
    }
    storage_accounts = {
      mlops_sa = {
        "Storage Blob Data Contributor" = {
          managed_identities = {
            keys   = ["fnapp_keyvault_secrets", "mlwrksp_keyvault_secrets"]
          }
        }
      }
    }
    machine_learning_workspaces = {
      ml_workspace_re1 = {
        "Reader" = {
          managed_identities = {
            keys   = ["mlwrksp_keyvault_secrets"]
          }
        }
        "Contributor" = {
          managed_identities = {
            keys   = ["fnapp_keyvault_secrets"]
          }
        }
      }
    }
  }
}
