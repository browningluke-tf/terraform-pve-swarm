# Terraform Proxmox Swarm VM Module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.7 |
| <a name="requirement_doppler"></a> [doppler](#requirement\_doppler) | ~> 1.1.6 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | ~> 2.9.11 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_doppler"></a> [doppler](#provider\_doppler) | 1.1.6 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dhcp_reservation"></a> [dhcp\_reservation](#module\_dhcp\_reservation) | github.com/browningluke-homelab/dhcp-reservations.git//terraform | v1.0.0 |
| <a name="module_pve_ci_manager"></a> [pve\_ci\_manager](#module\_pve\_ci\_manager) | app.terraform.io/browningluke/cloud-init/pve | ~> 1.1.0 |
| <a name="module_pve_ci_worker"></a> [pve\_ci\_worker](#module\_pve\_ci\_worker) | app.terraform.io/browningluke/cloud-init/pve | ~> 1.1.0 |

## Resources

| Name | Type |
|------|------|
| [doppler_secrets.pve](https://registry.terraform.io/providers/DopplerHQ/doppler/latest/docs/data-sources/secrets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ci_conf_path"></a> [ci\_conf\_path](#input\_ci\_conf\_path) | value | `string` | n/a | yes |
| <a name="input_default_password"></a> [default\_password](#input\_default\_password) | description | `string` | `"cloud1"` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | description | `string` | n/a | yes |
| <a name="input_doppler_token"></a> [doppler\_token](#input\_doppler\_token) | A token to authenticate with Doppler | `string` | n/a | yes |
| <a name="input_managers"></a> [managers](#input\_managers) | n/a | <pre>map(object({<br>    cores     = optional(number, 1)<br>    memory    = optional(number, 2048)<br>    balloon   = optional(number, 512)<br>    disk_size = optional(string, "4G")<br>  }))</pre> | n/a | yes |
| <a name="input_net_bridge"></a> [net\_bridge](#input\_net\_bridge) | value | `string` | `"vmbr99"` | no |
| <a name="input_node_template"></a> [node\_template](#input\_node\_template) | value | `string` | n/a | yes |
| <a name="input_pubkey_path"></a> [pubkey\_path](#input\_pubkey\_path) | value | `string` | n/a | yes |
| <a name="input_pve_host"></a> [pve\_host](#input\_pve\_host) | description | `string` | n/a | yes |
| <a name="input_pve_https"></a> [pve\_https](#input\_pve\_https) | n/a | `bool` | `true` | no |
| <a name="input_pve_node"></a> [pve\_node](#input\_pve\_node) | description | `string` | n/a | yes |
| <a name="input_pve_port"></a> [pve\_port](#input\_pve\_port) | n/a | `string` | `"8006"` | no |
| <a name="input_start_id"></a> [start\_id](#input\_start\_id) | value | `number` | n/a | yes |
| <a name="input_swarm_name"></a> [swarm\_name](#input\_swarm\_name) | value | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `list(string)` | `[]` | no |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | value | `string` | `"America/Vancouver"` | no |
| <a name="input_username"></a> [username](#input\_username) | description | `string` | `"luke"` | no |
| <a name="input_vlan_tag"></a> [vlan\_tag](#input\_vlan\_tag) | value | `string` | n/a | yes |
| <a name="input_worker_offset"></a> [worker\_offset](#input\_worker\_offset) | value | `number` | n/a | yes |
| <a name="input_workers"></a> [workers](#input\_workers) | n/a | <pre>map(object({<br>    cores     = optional(number, 1)<br>    memory    = optional(number, 2048)<br>    balloon   = optional(number, 512)<br>    disk_size = optional(string, "4G")<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
