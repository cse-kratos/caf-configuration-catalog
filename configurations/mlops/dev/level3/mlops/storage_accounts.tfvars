storage_accounts = {
  mlops_sa = {
    name                     = "mlops-sa"
    resource_group_key       = "azure_ml"
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    access_tier              = "Hot"
    is_hns_enabled           = true

    data_lake_filesystems = {
      processed = {
        name = "processed"
        properties = {
          dap = "processed"
        }
      }
      aml_flow_target = {
        name = "aml-flow-target"
        properties = {
          dap = "aml-flow-target-ml"
        }
      }
      aml_flow_source = {
        name = "aml-flow-source"
        properties = {
          dap = "aml-flow-source-ml"
        }
      }
      raw_event_hub = {
        name = "raw-event-hub"
        properties = {
          dap = "raw-event-hub"
        }
      }
      history = {
        name = "history"
        properties = {
          dap = "history"
        }
      }
    }
  }

  ml_workspace = {
    name                     = "ml_workspace"
    resource_group_key       = "azure_ml"
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    access_tier              = "Hot"
    
  }
}