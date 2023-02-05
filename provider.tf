provider "doppler" {
  doppler_token = var.doppler_token
}

provider "proxmox" {
  pm_api_url  = "${var.pve_https ? "https" : "http"}://${var.pve_host}:${var.pve_port}/api2/json"
  pm_user     = data.doppler_secrets.pve.map.PROVIDER_PVE_USER
  pm_password = data.doppler_secrets.pve.map.PROVIDER_PVE_PASS
}
