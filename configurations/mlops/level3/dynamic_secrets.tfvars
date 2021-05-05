# Store output attributes from the provisioned ACR resource into keyvault secret
dynamic_keyvault_secrets = {
  mlops_secrets = {
    mlops_acr = {
      output_key    = "azure_container_registries"
      resource_key  = "mlops_acr"
      attribute_key = "admin_password"
      secret_name   = "acr-password"
    }
    adls_connection_str = {
      output_key    = "storage_accounts"
      resource_key  = "mlops_sa"
      attribute_key = "primary_connection_string"
      secret_name   = "storage-account-connection-string"
    }
    adls_primary_key = {
      output_key    = "storage_accounts"
      resource_key  = "mlops_sa"
      attribute_key = "primary_access_key"
      secret_name   = "storage-account-key"
    }
    cosmos_connection_str = {
      output_key    = "cosmos_dbs"
      resource_key  = "cosmosdb_account_re1"
      attribute_key = "connection_string"
      secret_name   = "cosmos-connection-string"
    }
    cosmos_primary_key = {
      output_key    = "cosmos_dbs"
      resource_key  = "cosmosdb_account_re1"
      attribute_key = "primary_key"
      secret_name   = "cosmos-key"
    }
    cosmos_endpoint = {
      output_key    = "cosmos_dbs"
      resource_key  = "cosmosdb_account_re1"
      attribute_key = "endpoint"
      secret_name   = "cosmos-uri"
    }
  }
}