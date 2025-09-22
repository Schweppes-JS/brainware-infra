variable "ssh_public_keys" {
  description = "SSH public keys to inject into containers"
  type        = string
  default     = ""
}

variable "target_node" {
  description = "Target Proxmox node to create the container on"
  default     = "development-pve-1"
  type        = string
}

variable "user_password" {
  description = "Password for the user"
  type        = string
  sensitive   = true
}
