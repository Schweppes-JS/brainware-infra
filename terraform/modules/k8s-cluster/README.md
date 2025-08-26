# Kubernetes Cluster Module

This Terraform module creates a complete Kubernetes cluster in Proxmox with 3 master nodes and 6 worker nodes, plus an optional load balancer.

## Features

- **3 Master Nodes**: High-availability control plane
- **6 Worker Nodes**: Scalable compute resources
- **Optional Load Balancer**: For master node load balancing
- **Configurable Resources**: CPU, memory, and disk sizes
- **Proxmox Integration**: Uses Proxmox VM templates for consistent deployments

## Usage

### Basic Usage

```hcl
module "k8s_cluster" {
  source = "./modules/k8s-cluster"

  cluster_name = "my-k8s-cluster"
  target_node  = "pve1"
  template_id  = 9000  # Your Ubuntu/Debian template ID
}
```

### Advanced Usage

```hcl
module "k8s_cluster" {
  source = "./modules/k8s-cluster"

  cluster_name = "production-k8s"
  target_node  = "pve1"
  template_id  = 9000

  # Master node configuration
  master_cores     = 4
  master_memory    = 8192
  master_disk_size = "64G"
  master_vmid_start = 200

  # Worker node configuration
  worker_cores     = 8
  worker_memory    = 16384
  worker_disk_size = "128G"
  worker_vmid_start = 210

  # Load balancer configuration
  create_load_balancer = true
  lb_vmid             = 220
  lb_cores            = 2
  lb_memory           = 2048

  # Network and storage
  storage_pool   = "local-lvm"
  network_bridge = "vmbr0"
}
```

## Requirements

- Proxmox VE 6.0+
- Terraform 1.0+
- Telmate/proxmox provider
- A VM template with cloud-init support (Ubuntu/Debian recommended)

## Inputs

| Name                 | Description                                        | Type     | Default         | Required |
| -------------------- | -------------------------------------------------- | -------- | --------------- | :------: |
| cluster_name         | Name of the Kubernetes cluster                     | `string` | `"k8s-cluster"` |    no    |
| target_node          | Target Proxmox node name                           | `string` | n/a             |   yes    |
| template_id          | ID of the existing Proxmox template to clone from  | `number` | n/a             |   yes    |
| storage_pool         | Storage pool for VM disks                          | `string` | `"local-lvm"`   |    no    |
| network_bridge       | Network bridge for VMs                             | `string` | `"vmbr0"`       |    no    |
| master_vmid_start    | Starting VM ID for master nodes                    | `number` | `100`           |    no    |
| master_cores         | Number of CPU cores for master nodes               | `number` | `2`             |    no    |
| master_memory        | Memory size in MB for master nodes                 | `number` | `4096`          |    no    |
| master_disk_size     | Disk size for master nodes                         | `string` | `"32G"`         |    no    |
| worker_vmid_start    | Starting VM ID for worker nodes                    | `number` | `110`           |    no    |
| worker_cores         | Number of CPU cores for worker nodes               | `number` | `4`             |    no    |
| worker_memory        | Memory size in MB for worker nodes                 | `number` | `8192`          |    no    |
| worker_disk_size     | Disk size for worker nodes                         | `string` | `"64G"`         |    no    |
| create_load_balancer | Whether to create a load balancer for master nodes | `bool`   | `true`          |    no    |
| lb_vmid              | VM ID for load balancer                            | `number` | `120`           |    no    |
| lb_cores             | Number of CPU cores for load balancer              | `number` | `1`             |    no    |
| lb_memory            | Memory size in MB for load balancer                | `number` | `1024`          |    no    |
| lb_disk_size         | Disk size for load balancer                        | `string` | `"16G"`         |    no    |

## Outputs

| Name          | Description                                        |
| ------------- | -------------------------------------------------- |
| master_nodes  | Information about master nodes (names, vmids, ips) |
| worker_nodes  | Information about worker nodes (names, vmids, ips) |
| load_balancer | Information about load balancer (if created)       |
| cluster_info  | Summary information about the Kubernetes cluster   |
| all_node_ips  | All node IPs for easy access                       |

## Next Steps

After creating the VMs, you'll need to:

1. **Configure networking**: Ensure all nodes can communicate
2. **Install Kubernetes**: Use kubeadm or similar tool
3. **Configure load balancer**: Set up HAProxy or nginx for master nodes
4. **Join worker nodes**: Add workers to the cluster

## Example Ansible Integration

```hcl
# In your main.tf
module "k8s_cluster" {
  source = "./modules/k8s-cluster"
  # ... configuration
}

# Use outputs for Ansible inventory
resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/inventory.tpl", {
    master_ips = module.k8s_cluster.master_nodes.ips
    worker_ips = module.k8s_cluster.worker_nodes.ips
    lb_ip      = module.k8s_cluster.load_balancer.ip
  })
  filename = "${path.module}/ansible/inventory/k8s.ini"
}
```

## Notes

- VM IDs are automatically assigned starting from the specified start values
- All VMs are tagged for easy identification in Proxmox
- The module uses count to create multiple instances efficiently
- Consider your Proxmox node's resources when adjusting CPU/memory values
