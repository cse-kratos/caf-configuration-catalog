tags = {
  deploymentType = "CAF"
}

landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "networking"
  level               = "level3"
  key                 = "ml_ops"
  tfstates = {
    networking = {
      level   = "lower"
      tfstate = "caf_networking.tfstate"
    }
  }
}

resource_groups = {
  azure_ml = {
    name = "ml-ops"
  }
}

azurerm_application_insights = {
  ml_app_insight = {
    name               = "ml-ops"
    resource_group_key = "azure_ml"
    application_type   = "web"
  }
}
