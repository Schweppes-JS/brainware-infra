output "master_nodes" {
  description = "Information about master nodes"
  value = {
    names = proxmox_vm_qemu.k8s_master[*].name
    vmids = proxmox_vm_qemu.k8s_master[*].vmid
    ips   = proxmox_vm_qemu.k8s_master[*].default_ipv4_address
  }
}

output "worker_nodes" {
  description = "Information about worker nodes"
  value = {
    names = proxmox_vm_qemu.k8s_worker[*].name
    vmids = proxmox_vm_qemu.k8s_worker[*].vmid
    ips   = proxmox_vm_qemu.k8s_worker[*].default_ipv4_address
  }
}

output "cluster_info" {
  description = "Summary information about the Kubernetes cluster"
  value = {
    name              = var.cluster_name
    master_count      = length(proxmox_vm_qemu.k8s_master)
    worker_count      = length(proxmox_vm_qemu.k8s_worker)
    has_load_balancer = var.create_load_balancer
    target_node       = var.target_node
  }
}

output "all_node_ips" {
  description = "All node IPs for easy access"
  value = concat(
    proxmox_vm_qemu.k8s_master[*].default_ipv4_address,
    proxmox_vm_qemu.k8s_worker[*].default_ipv4_address,
    var.create_load_balancer ? [proxmox_vm_qemu.k8s_lb[0].default_ipv4_address] : []
  )
}
