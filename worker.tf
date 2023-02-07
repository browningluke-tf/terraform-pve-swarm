module "pve_ci_worker" {
  source  = "app.terraform.io/browningluke/cloud-init/pve"
  version = "~> 1.1.0"

  for_each = {
    for key, value in var.workers :
    key => value
  }

  name = "worker${each.key}.${var.swarm_name}"
  vmid = var.start_id + var.worker_offset + tonumber(each.key)

  target_node = var.pve_node
  template    = var.node_template

  /* CI config */
  ci_conf_path = var.ci_conf_path

  hostname    = "worker${each.key}.${var.swarm_name}"
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

  tags = concat(var.tags, [
    "swarm", var.swarm_name
  ])

  /* PVE connection details */
  pve_host     = var.pve_host
  pve_user     = data.doppler_secrets.pve.map.PVE_USER
  pve_password = data.doppler_secrets.pve.map.PVE_PASS
}
