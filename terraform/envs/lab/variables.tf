variable "proxmox_api_url" {
  type        = string
  description = "Proxmox API URL"
  default     = "https://your-proxmox-host:8006/api2/json"
}

variable "proxmox_token_id" {
  type        = string
  description = "Proxmox API token ID"
  sensitive   = true
}

variable "proxmox_token_secret" {
  type        = string
  description = "Proxmox API token secret"
  sensitive   = true
}

variable "proxmox_node" {
  type        = string
  description = "Target Proxmox node name"
  default     = "pve1"
}

variable "template_id" {
  type        = number
  description = "ID of the VM template to clone from"
  default     = 9000
}
