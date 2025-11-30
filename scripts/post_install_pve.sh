#!/bin/bash

# Remove old host keys to avoid verification errors
ssh-keygen -R 10.31.100.1:22
ssh-keygen -R 10.31.100.2:22
ssh-keygen -R 10.31.100.3:22

# Copy SSH keys to Proxmox hosts (auto-accept host keys)
ssh-copy-id -o StrictHostKeyChecking=no -p 22 root@10.31.100.1
ssh-copy-id -o StrictHostKeyChecking=no -p 22 root@10.31.100.2  
ssh-copy-id -o StrictHostKeyChecking=no -p 22 root@10.31.100.3

# Change to project root directory
cd "$(dirname "$0")/.."

# Run the Proxmox playbook
ansible-playbook -i ansible/inventories/pve/hosts.ini ansible/playbooks/post-install/debian_proxmox.yml