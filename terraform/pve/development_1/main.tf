terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

# module "development_k8s_cluster" {
#   source       = "../../modules/k8s-cluster"
#   cluster_name = "development-k8s"
#   template_id  = 901

#   master_count      = 1
#   master_cores      = 1
#   master_memory     = 2048
#   master_disk_size  = 16
#   master_vmid_start = 300

#   worker_count      = 2
#   worker_cores      = 2
#   worker_memory     = 4096
#   worker_disk_size  = 32
#   worker_vmid_start = 310
# }

# module "development_gitlab" {
#   source          = "../../modules/container/alpine"
#   hostname        = "development-gitlab"
#   ssh_public_keys = var.ssh_public_keys
#   network_ip      = "192.168.31.13/24"
#   memory          = 256
#   disk_size       = "32G"
#   cores           = 1
#   vmid            = 103
# }
