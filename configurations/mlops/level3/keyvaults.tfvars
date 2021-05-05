keyvaults = {
  mlops_secrets = {
    name                = "mlops_secrets"
    resource_group_key  = "azure_ml"
    sku_name            = "standard"
    soft_delete_enabled = true
    purge_protection_enabled = true

    creation_policies = {
      logged_in_user = {
        # add the user running terraform in the keyvault policy
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }
  }
}

keyvault_access_policies = {
  mlops_secrets = {
    appsvc_keyvault_secrets = {
      managed_identity_key    = "appsvc_keyvault_secrets"
      secret_permissions      = ["Get", "List"]
    }

    fnapp_keyvault_secrets = {
      managed_identity_key    = "fnapp_keyvault_secrets"
      secret_permissions      = ["Get", "List"]
    }

    mlwrksp_keyvault_secrets = {
      managed_identity_key    = "mlwrksp_keyvault_secrets"
      secret_permissions      = ["Get", "List"]
    }
  }
}