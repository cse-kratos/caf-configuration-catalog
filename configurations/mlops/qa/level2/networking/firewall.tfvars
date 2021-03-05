azurerm_firewalls = {
  # Southeastasia firewall (do not change the key when created)
  fw_re1 = {
    region             = "region1"
    name               = "network-firewall"
    resource_group_key = "vnet_hub_region1"
    vnet_key           = "hub_re1"
    public_ip_key      = "az_fw_pip"

  }

}