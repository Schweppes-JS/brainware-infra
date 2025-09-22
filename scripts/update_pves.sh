#!/bin/bash

# Update Proxmox hosts using Ansible
cd "$(dirname "$0")/.."
ansible-playbook -i ansible/inventories/pve/hosts.ini ansible/playbooks/maintenance/proxmox_update.yml
