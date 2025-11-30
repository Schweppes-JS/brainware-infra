terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

resource "proxmox_vm_qemu" "ubuntu_vm" {
  name        = var.name
  description = var.description
  target_node = var.target_node
  # pool        = var.storage_pool
  clone      = "ubuntu-cloud-init"
  full_clone = false
  agent      = 1
  os_type    = "cloud-init"
  cpu {
    cores   = var.cores
    sockets = 1
    type    = "x86-64-v2-AES"
  }
  memory  = var.memory
  scsihw  = "virtio-scsi-single"
  onboot  = var.start_on_boot
  startup = var.boot_order

  # Setup the disk
  disks {
    ide {
      ide3 {
        cloudinit {
          storage = var.storage_pool
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size      = 8
          cache     = "writeback"
          storage   = var.storage_pool
          replicate = true
        }
      }
    }
  }

  # Setup the network interface and assign a vlan tag: 256
  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }
  serial {
    id   = 0
    type = "socket"
  }
  vga {
    type   = "std"
    memory = 16
  }
  boot       = "order=scsi0"
  ipconfig0  = "ip=${var.network_ip},gw=${var.gateway}"
  skip_ipv6  = true
  sshkeys    = var.ssh_public_keys
  ciuser     = var.username
  cipassword = var.password

  provisioner "local-exec" {
    command = <<-EOT
      ansible-playbook ${path.root}/../ansible/playbooks/post-install/ubuntu_cloud_init.yml \
        -i ${path.root}/../ansible/inventories/pve/hosts.ini \
        -e "vm_ip='${split("/", var.network_ip)[0]}'" \
        -e "vmid='${var.vmid}'" \
        -e "target_node='${var.target_node}'" \
        -e "user_name='${var.user_name}'" \
        -e "ssh_key_path='~/.ssh/id_rsa'"
    EOT
  }
}
