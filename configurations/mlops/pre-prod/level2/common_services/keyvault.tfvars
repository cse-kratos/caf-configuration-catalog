keyvaults = {
  common_vault = {
    name                = "common-vault"
    resource_group_key  = "common_services"
    sku_name            = "standard"
    useprefix           = true   
    
    creation_policies = {
      logged_in_user = {
        # if the key is set to "logged_in_user" add the user running terraform in the keyvault policy
        # More examples in /examples/keyvault
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
        key_permissions = ["Get", "List", "Delete", "Purge", "Recover"]
        certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Purge", "Recover"]
      }
    }  
  }
}
