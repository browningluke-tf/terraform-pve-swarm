terraform {
  required_providers {
    doppler = {
      source = "DopplerHQ/doppler"
    }
    proxmox = {
      source  = "telmate/proxmox"
      version = "~> 2.9.11"
    }
  }
}
