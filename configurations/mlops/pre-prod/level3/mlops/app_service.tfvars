app_services = {
  webapp1 = {
    resource_group_key      = "azure_ml"
    name                    = "mlops_app_srv"
    app_service_plan_key    = "asp1"
    application_insight_key = "ml_app_insight"

    settings = {
      enabled = true
      site_config = {
        always_on = "true"
        health_check_path = "/actuator/health" 
      }
    }

    identity = {
      managed_identity_keys = [
        "appsvc_keyvault_secrets"
      ]
    }

    app_settings = {
      PROFILE = "preprod"
      COSMOS_DB_NAME = "ml-protect"
    }

    dynamic_app_settings = {
      "APP_CONFIG_ENDPOINT" = {
        app_config = {
          mlops_config = {
            attribute_key = "endpoint"
          }
        }
      }

      "KEYVAULT_URI" = {
        keyvaults = {
          mlops_secrets = {
            attribute_key = "vault_uri"
          }
        }
      }

      "DOCKER_REGISTRY_SERVER_URL" = {
        azure_container_registries = {
          mlops_acr = {
            attribute_key = "login_server_url"
          }
        }
      }

      "DOCKER_REGISTRY_SERVER_USERNAME" = {
        azure_container_registries = {
          mlops_acr = {
            attribute_key = "admin_username"
          }
        }
      }

      "DOCKER_REGISTRY_SERVER_PASSWORD" = {
        azure_container_registries = {
          mlops_acr = {
            attribute_key = "admin_password"
          }
        }
      }

      "CLIENT_ID" = {
        managed_identities = {
          appsvc_keyvault_secrets = {
            attribute_key = "client_id"
          }
        }
      }

      "TENANT_ID" = {
        client_config = {
          config = {
            attribute_key = "tenant_id"
          }
        }
      }
    }
  }
}