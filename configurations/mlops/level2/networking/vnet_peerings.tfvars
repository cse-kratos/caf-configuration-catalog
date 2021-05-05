vnet_peerings = {
  hub-re1_TO_spoke-re1 = {
    name = "hub-re1_TO_spoke-re1"
    from = {
      vnet_key = "hub_re1"
    }
    to = {
      vnet_key = "spoke_re1"
    }
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }

  spoke-re1_TO_hub-re1 = {
    name = "hub_re2_TO_hub_re1"
    from = {
      vnet_key = "spoke_re1"
    }
    to = {
      vnet_key = "hub_re1"
    }
    allow_virtual_network_access = true
    allow_forwarded_traffic      = false
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }

}