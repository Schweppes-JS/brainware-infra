terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

module "development_1_nginx_proxy_manager" {
  hostname        = "nginx-proxy-manager"
  source          = "../../modules/containers/alpine"
  ssh_public_keys = var.ssh_public_keys
  network_ip      = "192.168.31.100/24"
  target_node     = var.target_node
  memory          = 1024
  disk_size       = "4G"
  cores           = 1
  vmid            = 100
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
#   source          = "../../modules/containers/alpine"
#   hostname        = "development-gitlab"
#   network_ip      = "192.168.31.13/24"
#   ssh_public_keys = var.ssh_public_keys
#   memory          = 256
#   disk_size       = "32G"
#   cores           = 1
#   vmid            = 103
# }
