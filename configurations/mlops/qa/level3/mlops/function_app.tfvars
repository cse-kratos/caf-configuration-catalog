function_apps = {
  functionapp1 = {
    resource_group_key      = "azure_ml"
    name                    = "hyas-mlops-func-qa"
    app_service_plan_key    = "asp1"
    application_insight_key = "ml_app_insight"
    storage_account_key     = "mlops_sa"
 
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
    }
  }
}
