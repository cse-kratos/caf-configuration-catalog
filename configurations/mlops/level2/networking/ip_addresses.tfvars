public_ip_addresses = {

  az_fw_pip = {
    name                    = "az_fw_re1_pip1"
    region                  = "region1"
    resource_group_key      = "vnet_hub_region1"
    sku                     = "Standard"
    allocation_method       = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"

  }
}