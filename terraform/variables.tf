variable "proxmox_api_url" {
  type        = string
  description = "Proxmox API URL"
  sensitive   = true
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
