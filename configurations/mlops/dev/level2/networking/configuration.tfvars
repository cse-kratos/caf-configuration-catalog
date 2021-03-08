landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "foundations"
  level               = "level2"
  key                 = "networking"
  tfstates = {
    foundations = {
      level   = "lower"
      tfstate = "caf_foundations.tfstate"
    }
  }
}

resource_groups = {
  vnet_hub_region1 = {
    name = "vnet-hub"
  }
  vnet_spoke_region1 = {
    name = "vnet-spoke"
  }
}
