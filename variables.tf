/* Doppler */
variable "doppler_token" {
  type        = string
  description = "A token to authenticate with Doppler"
}

/* Swarm */
variable "swarm_name" {
  type        = string
  description = "value"
}

variable "domain_name" {
  type        = string
  description = "description"
}

/* Nodes */
variable "node_template" {
  type        = string
  description = "value"
}

variable "managers" {
  type = map(object({
    cores     = optional(number, 1)
    memory    = optional(number, 2048)
    balloon   = optional(number, 512)
    disk_size = optional(string, "4G")
  }))
}

variable "workers" {
  type = map(object({
    index     = number
    cores     = optional(number, 1)
    memory    = optional(number, 2048)
    balloon   = optional(number, 512)
    disk_size = optional(string, "4G")
  }))
}

/* Network */
variable "vlan_tag" {
  type        = string
  description = "value"
}

variable "net_bridge" {
  type        = string
  default     = "vmbr99"
  description = "value"
}

/* Cloud-init */
variable "username" {
  type        = string
  default     = "luke"
  description = "description"
}

variable "default_password" {
  type        = string
  default     = "cloud1"
  description = "description"
}

variable "timezone" {
  type        = string
  default     = "America/Vancouver"
  description = "value"
}

variable "pubkey_path" {
  type        = string
  description = "value"
}

variable "ci_cdrom_storage" {
  type        = string
  default     = null
  description = "value"
}

/* Proxmox */
variable "start_id" {
  type        = number
  description = "value"
}

variable "worker_offset" {
  type        = number
  description = "value"
}

variable "pve_node" {
  type        = string
  description = "description"
}

variable "pve_host" {
  type        = string
  description = "description"
}