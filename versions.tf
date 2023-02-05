terraform {
  required_version = "~> 1.3.7"

  required_providers {
    doppler = {
      source  = "DopplerHQ/doppler"
      version = "~> 1.1.6"
    }
    proxmox = {
      source  = "telmate/proxmox"
      version = "~> 2.9.11"
    }
  }
}
