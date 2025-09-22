variable "target_node" {
  description = "Target Proxmox node to create the container on"
  type        = string
}

variable "hostname" {
  description = "Hostname for the Debian container"
  type        = string
}

variable "ostemplate" {
  description = "Debian template to use"
  type        = string
  default     = "local:vztmpl/debian-12-standard_12.12-1_amd64.tar.zst"
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
  default     = "192.168.31.1"
}

variable "network_subnet" {
  description = "Network subnet"
  type        = string
  default     = "24"
}

variable "storage_pool" {
  description = "Storage pool to use for the container"
  type        = string
  default     = "local-lvm"
}

variable "disk_size" {
  description = "Disk size for the container (e.g., '4G', '1T')"
  type        = string
  default     = "8G"
}

variable "cores" {
  description = "Number of CPU cores to allocate"
  type        = number
  default     = 1
}

variable "memory" {
  description = "Memory to allocate in MB"
  type        = number
  default     = 1024
}

variable "swap" {
  description = "Swap memory to allocate in MB"
  type        = number
  default     = 1024
}


variable "ssh_public_keys" {
  description = "SSH public keys to inject into the container (comma-separated string)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to the container (comma-separated string)"
  type        = string
  default     = "debian,lxc"
}

variable "description" {
  description = "Description for the container"
  type        = string
  default     = "Debian LXC Container"
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

variable "vmid" {
  description = "VM ID for the new VM"
  type        = number
}

variable "user_name" {
  description = "Name for the user"
  type        = string
  default     = "schweppes"
  sensitive   = true
}

variable "user_password" {
  description = "Password for the user"
  type        = string
  sensitive   = true
}
