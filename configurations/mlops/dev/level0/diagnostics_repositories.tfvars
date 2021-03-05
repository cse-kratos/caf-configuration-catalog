# Defines different repositories for the diagnostics logs
# Storage accounts, log analytics, event hubs

diagnostic_storage_accounts = {
  # Stores diagnostic logging for region1
  diaglogs_region1 = {
    name                     = "diaglogsrg1"
    region                   = "region1"
    resource_group_key       = "level0"
    account_kind             = "BlobStorage"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    access_tier              = "Cool"
  }
  # Stores security logs for siem default region"
  diagsiem_region1 = {
    name                     = "siemsg1"
    resource_group_key       = "level0"
    account_kind             = "BlobStorage"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    access_tier              = "Cool"
  }
  # Stores boot diagnostic for region1
  bootdiag_region1 = {
    name                     = "bootrg1"
    region                   = "region1"
    resource_group_key       = "level0"
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    access_tier              = "Cool"
  }
}

#
# Define the settings for log analytics workspace and solution map
#
diagnostic_log_analytics = {
  central_logs_region1 = {
    region             = "region1"
    name               = "logs"
    resource_group_key = "level0"
    # you can setup up to 5 key
    diagnostic_profiles = {
      central_logs_region1 = {
        definition_key   = "log_analytics"
        destination_type = "log_analytics"
        destination_key  = "central_logs"
      }
    }
    solutions_maps = {
      NetworkMonitoring = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/NetworkMonitoring"
      },
      ADAssessment = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/ADAssessment"
      },
      ADReplication = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/ADReplication"
      },
      AgentHealthAssessment = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/AgentHealthAssessment"
      },
      DnsAnalytics = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/DnsAnalytics"
      },
      ContainerInsights = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/ContainerInsights"
      },
      KeyVaultAnalytics = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/KeyVaultAnalytics"
      }
    }
  }
}

# Event hub diagnostics
event_hub_namespaces = {
  central_logs_region1 = {
    name               = "logs"
    resource_group_key = "level0"
    sku                = "Standard"
    region             = "region1"

    diagnostic_profiles = {
      central_logs_region1 = {
        definition_key   = "event_hub_namespace"
        destination_type = "storage"
        destination_key  = "all_regions"
      }
    }
  }
}


