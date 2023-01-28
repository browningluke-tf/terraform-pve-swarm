locals {
  manager_hostname_prefix = "${var.swarm_name}-manager"
}

module "pve_ci_manager" {
  source = "git@github.com:browningluke-tf/terraform-pve-ci-module.git?ref=main"

  for_each = {
    for key, value in var.managers :
    key => value
  }

  name = "${local.manager_hostname_prefix}${each.key}"
  vmid = var.start_id + tonumber(each.key)

  target_node = var.pve_node
  template    = var.node_template

  /* CI config */
  ci_conf_path     = "${path.module}/cloud-init"
  ci_cdrom_storage = var.ci_cdrom_storage

  hostname    = "${local.manager_hostname_prefix}${each.key}"
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
