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

variable "ssh_public_keys" {
  type        = string
  description = "SSH public keys to inject into containers"
  default     = ""
}

variable "user_password" {
  type        = string
  description = "Password for the user"
  sensitive   = true
}

variable "staging_target_node" {
  type        = string
  description = "Staging Proxmox node to create the container on"
}

variable "development_target_node" {
  type        = string
  description = "Development Proxmox node to create the container on"
}
