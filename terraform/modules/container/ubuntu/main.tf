terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

resource "proxmox_lxc" "ubuntu_lxc" {
  target_node     = var.target_node
  hostname        = var.hostname
  ostemplate      = var.ostemplate
  unprivileged    = var.unprivileged
  cores           = var.cores
  memory          = var.memory
  swap            = var.swap
  ssh_public_keys = var.ssh_public_keys
  tags            = var.tags
  description     = var.description
  onboot          = var.start_on_boot
  start           = var.start_after_creation
  startup         = var.boot_order
  vmid            = var.vmid
  network {
    name   = "eth0"
    bridge = var.network_bridge
    ip     = var.network_ip
    gw     = var.network_gateway
  }
  rootfs {
    storage = var.storage_pool
    size    = var.disk_size
  }

  provisioner "local-exec" {
    command = <<-EOT
      ansible-playbook ${path.root}/../ansible/playbooks/post-install/ubuntu_container.yml \
        -i ${path.root}/../ansible/inventories/pve/hosts.ini \
        -e "container_ip='${split("/", var.network_ip)[0]}'" \
        -e "vmid='${var.vmid}'" \
        -e "target_node='${var.target_node}'" \
        -e "user_password='${var.user_password}'" \
        -e "ssh_public_keys='${var.ssh_public_keys}'" \
        -e "user_name='${var.user_name}'"
    EOT
  }
}
