cosmos_dbs = {
  cosmosdb_account_re1 = {
    name                      = "cosmosdb-ex101"
    resource_group_key        = "azure_ml"
    offer_type                = "Standard"
    enable_automatic_failover = "true"

    consistency_policy = {
      consistency_level       = "BoundedStaleness"
      max_interval_in_seconds = "300"
      max_staleness_prefix    = "100000"
    }
    # Primary location (Write Region)
    geo_locations = {
      primary_geo_location = {
        region            = "region1"
        zone_redundant    = false
        failover_priority = 0
      }
      # failover location
      failover_geo_location = {
        location          = "westus"
        failover_priority = 1
      }
    }
  }
}

app_config = {
  mlops_config = {
    name               = "app-config"
    resource_group_key = "azure_ml"
    region             = "region1"

    identity = {
      type = "SystemAssigned"
    }

    dynamic_settings = {
      "ACR_ADDRESS" = {
        azure_container_registries = {
          mlops_acr = {
            attribute_key = "login_server"
          }
        }
      }

      "ACR_USERNAME" = {
        azure_container_registries = {
          mlops_acr = {
            attribute_key = "admin_username"
          }
        }
      }

      "AML_IDENTITY_ID" = {
        managed_identities = {
          mlwrksp_keyvault_secrets = {
            attribute_key = "client_id"
          }
        }
      }

      "APPINSIGHTS_INSTRUMENTATION_KEY" = {
        azurerm_application_insights = {
          ml_app_insight = {
            attribute_key = "instrumentation_key"
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

      "LOGIC_APP_ENDPOINT" = {
        logic_app_workflow = {
          workflow = {
            attribute_key = "access_endpoint"
          }
        }
      }

      "RESOURCE_GROUP" = {
        resource_groups = {
          azure_ml = {
            attribute_key = "name"
          }
        }
      }

      "SUBSCRIPTION_ID" = {
        client_config = {
          config = {
            attribute_key = "subscription_id"
          }
        }
      }

      "STORAGE_ACCOUNT_NAME" = {
        storage_accounts = {
          mlops_sa = {
            attribute_key = "name"
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

      "WORKSPACE_NAME" = {
        machine_learning_workspaces = {
          ml_workspace_re1 = {
            attribute_key = "name"
          }
        }
      }
    }

    settings = {
      "ADLS_FILESYSTEM"       = "source$Default"
      "BLOB_NAME"             = "process-all-blobs"
      "COMPUTE_NAME"          = "hyas-aml"
      "ENVIRONMENT_NAME"      = "DEV"
      "EXPERIMENT_NAME"       = "model-scoring"
      "MODEL_IS_ACTIVE"       = "True"
      "MODEL_NAME"            = "latest_model_lightgbm"
      "PIPELINE_NAME"         = "aml-model-scoring"
      "SCRIPT_NAME"           = "blob_copy.py"
      "SOURCE_CONTAINER_NAME" = "aml-flow-source"
      "TARGET_CONTAINER_NAME" = "aml-flow-target"
      "LOGICAL_PIPELINE_TRIGGER_TYPE" = "manual"
      "VM_SIZE" = "Standard_D14_v2"
      "AML_CLUSTER_MIN_NODES" ="0"
      "AML_CLUSTER_MAX_NODES" = "4"
      "SECONDS_TO_COOLDOWN" = "300"
      "VM_PRIORITY" = "VM_PRIORITY"
      "DATA_PREP_IMAGE" = "data-prep"
      "LOGICAL_PIPELINE_CORRELATION_ID" = "none"
      "LOGICAL_PIPELINE_PHASE_ID" = "hyas-protect-phase"
    }
  }
}