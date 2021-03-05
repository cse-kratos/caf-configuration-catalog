storage_accounts = {
  alds = {
    name                      = "adls"
    resource_group_key        = "common_services"
    account_kind              = "StorageV2"
    account_tier              = "Standard"
    account_replication_type  = "GRS"
    postfix                   = "00"
    is_hns_enabled            = true

    data_lake_filesystems = {
      raw = {
        name = "raw"
        properties = {
          dap = "raw-ml"
        }
      }
      history = {
        name = "history"
        properties = {
          dap = "history-ml"
        }
      }
      processed = {
        name = "processed"
        properties = {
          dap = "process-ml"
        }
      }
    }
  }
}
