function_apps = {
  functionapp1 = {
    resource_group_key      = "azure_ml"
    name                    = "application-mlops-func-dev"
    app_service_plan_key    = "asp1"
    application_insight_key = "ml_app_insight"
    storage_account_key     = "mlops_sa"
    storage_account_name    = "mlops_sa"
 
    settings = {
      enabled = true
    }

    identity = {
      managed_identity_keys = [
        "fnapp_keyvault_secrets"
      ]
    }

    dynamic_app_settings = {
      "APP_CONFIG_ENDPOINT" = {
        app_config = {
          mlops_config = {
            attribute_key = "endpoint"
          }
        }
      }

      "KEY_VAULT_NAME" = {
        keyvaults = {
          mlops_secrets = {
            attribute_key = "name"
          }
        }
      }

      "AZURE_CLIENT_ID" = {
       managed_identities = {
          fnapp_keyvault_secrets = {
            attribute_key = "client_id"
          }
        }
      }

      "AZURE_TENANT_ID" = {
        client_config = {
          config = {
            attribute_key = "tenant_id"
          }
        }
      }

    }
    app_settings = {
      FUNCTIONS_EXTENSION_VERSION = "~3"
      FUNCTIONS_WORKER_RUNTIME = "python"
    }
  }
}
