terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_token_id
  pm_api_token_secret = var.proxmox_token_secret
  pm_tls_insecure     = true
}

# Kubernetes cluster
module "k8s_cluster" {
  source = "../../modules/k8s-cluster"

  cluster_name = "lab-k8s"
  target_node  = var.proxmox_node
  template_id  = var.template_id

  # Master nodes - smaller for lab environment
  master_cores      = 2
  master_memory     = 4096
  master_disk_size  = "32G"
  master_vmid_start = 100

  # Worker nodes - moderate size for lab
  worker_cores      = 4
  worker_memory     = 8192
  worker_disk_size  = "64G"
  worker_vmid_start = 110

  # Load balancer
  create_load_balancer = true
  lb_vmid              = 120
  lb_cores             = 1
  lb_memory            = 1024

  # Network and storage
  storage_pool   = "local-lvm"
  network_bridge = "vmbr0"
}

# Output cluster information
output "k8s_cluster_info" {
  description = "Kubernetes cluster information"
  value       = module.k8s_cluster.cluster_info
}

output "master_nodes" {
  description = "Master node details"
  value       = module.k8s_cluster.master_nodes
}

output "worker_nodes" {
  description = "Worker node details"
  value       = module.k8s_cluster.worker_nodes
}

output "load_balancer" {
  description = "Load balancer details"
  value       = module.k8s_cluster.load_balancer
}
