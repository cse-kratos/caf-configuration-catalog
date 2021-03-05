vnets = {
  hub_re1 = {
    resource_group_key = "vnet_hub_region1"
    vnet = {
      name          = "hub-re1"
      address_space = ["10.10.100.0/24"]
    }
    specialsubnets = {
      AzureFirewallSubnet = {
        name = "AzureFirewallSubnet" #Must be called AzureFirewallSubnet
        cidr = ["10.10.100.192/26"]
      }
    }
    subnets = {
      jumphost = {
        name    = "jumphost"
        cidr    = ["10.10.100.0/25"]
        nsg_key = "jumphost"
      }
    }
  }

  spoke_re1 = {
    resource_group_key = "vnet_spoke_region1"
    vnet = {
      name          = "spoke-re1"
      address_space = ["10.11.100.0/24"]
    }
    specialsubnets = {}
    subnets = {
      jumphost = {
        name    = "jumphost"
        cidr    = ["10.11.100.0/25"]
        nsg_key = "jumphost"
      }
      webapp1 = {
        name = "webapp-presentation-tier"
        cidr = ["10.11.100.128/25"]
      }
    }
  }
}