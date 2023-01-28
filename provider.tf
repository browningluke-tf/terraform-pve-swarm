provider "doppler" {
  doppler_token = var.doppler_token
}

provider "proxmox" {
  pm_api_url  = "https://solis.browningluke.dev:8006/api2/json"
  pm_user     = data.doppler_secrets.pve.map.PROVIDER_PVE_USER
  pm_password = data.doppler_secrets.pve.map.PROVIDER_PVE_PASS
}
