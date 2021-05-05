azure_container_registries = {
  mlops_acr = {
    name                       = "mlops-acr"
    resource_group_key         = "azure_ml"
    sku                        = "Premium"
    georeplication_region_keys = ["region2"]
    admin_enabled              = true
  }
}