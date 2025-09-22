#!/bin/bash

# Update VMs using Ansible
cd "$(dirname "$0")/.."
ansible-playbook -i ansible/inventories/virtualization/hosts.ini ansible/playbooks/maintenance/virtualization_update.yml
