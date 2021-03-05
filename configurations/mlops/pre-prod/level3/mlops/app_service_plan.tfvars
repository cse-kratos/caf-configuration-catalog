app_service_plans = {
  asp1 = {
    resource_group_key = "azure_ml"
    name               = "mlops_app_plan"
    kind               = "Linux"
    reserved           = true
    
    sku = {
      tier = "Standard"
      size = "S1"
    }
  }
}
