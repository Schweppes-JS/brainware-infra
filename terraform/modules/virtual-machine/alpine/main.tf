terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

resource "proxmox_vm_qemu" "alpine_vm" {
  name        = var.name
  description = var.description
  target_node = var.target_node
  vmid        = var.vmid
  clone       = var.clone_template
  full_clone  = true
  agent       = 1
  os_type     = "cloud-init"
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
          size      = var.disk_size_gb
          cache     = "writeback"
          storage   = var.storage_pool
          replicate = true
        }
      }
    }
  }

  # Setup the network interface
  network {
    id     = 0
    model  = "virtio"
    bridge = var.network_bridge
  }
  serial {
    id   = 0
    type = "socket"
  }
  bios = "seabios"
  vga {
    type   = "serial0"
    memory = 16
  }
  boot      = "order=scsi0"
  ipconfig0 = "ip=${var.network_ip},gw=${var.gateway}"
  skip_ipv6 = true

  sshkeys    = var.ssh_public_keys
  ciuser     = var.username
  cipassword = var.password


  provisioner "local-exec" {
    command = <<-EOT
      ansible-playbook ${path.root}/../ansible/playbooks/post-install/alpine_cloud_init.yml \
        -i "${split("/", var.network_ip)[0]}," \
        -e "vm_ip='${split("/", var.network_ip)[0]}'" \
        -e "user_name='${var.username}'" \
    EOT
  }
}
