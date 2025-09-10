variable "target_node" {
  description = "Target Proxmox node to create the container on"
  default     = "shvets"
  type        = string
}

variable "hostname" {
  description = "Hostname for the Ubuntu container"
  type        = string
}

variable "ostemplate" {
  description = "Ubuntu 24.04 template to use"
  type        = string
  default     = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
}

variable "unprivileged" {
  description = "Whether to create an unprivileged container"
  type        = bool
  default     = true
}

variable "network_bridge" {
  description = "Network bridge to use"
  type        = string
  default     = "vmbr0"
}

variable "network_ip" {
  description = "IP address for the container (CIDR notation)"
  type        = string
}

variable "network_gateway" {
  description = "Network gateway"
  type        = string
}

variable "storage_pool" {
  description = "Storage pool to use for the container"
  type        = string
  default     = "local-lvm"
}

variable "disk_size" {
  description = "Disk size for the container (e.g., '4G', '1T')"
  type        = string
  default     = "4G"
}

variable "cores" {
  description = "Number of CPU cores to allocate"
  type        = number
  default     = 1
}

variable "memory" {
  description = "Memory to allocate in MB"
  type        = number
  default     = 512
}

variable "swap" {
  description = "Swap memory to allocate in MB"
  type        = number
  default     = 512
}


variable "ssh_public_keys" {
  description = "SSH public keys to inject into the container (comma-separated string)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to the container (comma-separated string)"
  type        = string
  default     = "ubuntu,lxc"
}

variable "description" {
  description = "Description for the container"
  type        = string
  default     = "Ubuntu 24.04 LXC Container"
}

variable "start_on_boot" {
  description = "Whether to start the container on boot"
  type        = bool
  default     = true
}

variable "start_after_creation" {
  description = "Whether to start the container after creation"
  type        = bool
  default     = true
}

variable "boot_order" {
  description = "Boot order priority (lower number = higher priority, 0 = disabled, 999 = start last)"
  type        = number
  default     = 999
}
