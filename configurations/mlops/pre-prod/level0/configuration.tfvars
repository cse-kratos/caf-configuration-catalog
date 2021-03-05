landingzone = {
  backend_type = "azurerm"
  level        = "level0"
  key          = "launchpad"
}

prefix = "mlops-protect"

# Default region. When not set to a resource it will use that value
default_region = "region1"

regions = {
  region1 = "northeurope"
  region2 = "westus"
}

# core tags to be applied accross this landing zone
tags = {
  environment    = "pre-prod"
  deploymentType = "CAF"
  application = "hyas-protect-mlops"
}


# naming convention settings
# for more settings on naming convention, please refer to the provider documentation: https://github.com/aztfmod/terraform-provider-azurecaf
#
# passthrough means the default CAF naming convention is not applied and you are responsible
# of the unicity of the names you are giving. the CAF provider will clear out
#  passthrough = true
# adds random chars at the end of the names produced by the provider
random_length = 4

# all resources deployed will inherit tags from the parent resource group
inherit_tags = true

launchpad_key_names = {
  azuread_app            = "caf_launchpad_level0"
  keyvault_client_secret = "aadapp-caf-launchpad-level0"
  tfstates = [
    "level0",
    "level1",
    "level2",
    "level3",
    "level4"
  ]
}

resource_groups = {
  level0 = {
    name = "launchpad-level0"
    tags = {
      level = "level0"
    }
  }
  level1 = {
    name = "launchpad-level1"
    tags = {
      level = "level1"
    }
  }
  level2 = {
    name = "launchpad-level2"
    tags = {
      level = "level2"
    }
  }
  level3 = {
    name = "launchpad-level3"
    tags = {
      level = "level3"
    }
  }
  level4 = {
    name = "launchpad-level4"
    tags = {
      level = "level4"
    }
  }
}
