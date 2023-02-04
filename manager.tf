module "dhcp_reservation" {
  source = "git@github.com:browningluke-homelab/dhcp-reservations.git//terraform"

  for_each = {
    for key, value in var.managers :
    key => value
  }
  
  hostname = "manager${each.key}.${var.swarm_name}"
}

module "pve_ci_manager" {
  source = "git@github.com:browningluke-tf/terraform-pve-ci-module.git?ref=main"

  for_each = {
    for key, value in var.managers :
    key => value
  }

  name = "manager${each.key}.${var.swarm_name}"
  vmid = var.start_id + tonumber(each.key)

  target_node = var.pve_node
  template    = var.node_template

  /* CI config */
  ci_conf_path     = var.ci_conf_path

  hostname    = "manager${each.key}.${var.swarm_name}"
  domain_name = var.domain_name

  username         = var.username
  default_password = var.default_password
  pubkey_path      = var.pubkey_path

  timezone = var.timezone

  /* Hardware */
  cores   = each.value.cores
  memory  = each.value.memory
  balloon = each.value.balloon

  network = [
    {
      model    = "virtio"
      bridge   = var.net_bridge
      vlan_tag = var.vlan_tag
      mac = module.dhcp_reservation[each.key].mac
    }
  ]

  disk = [
    {
      type    = "scsi"
      storage = "local-lvm"
      size    = each.value.disk_size
    }
  ]

  /* PVE connection details */
  pve_host     = var.pve_host
  pve_user     = data.doppler_secrets.pve.map.PVE_USER
  pve_password = data.doppler_secrets.pve.map.PVE_PASS
}
