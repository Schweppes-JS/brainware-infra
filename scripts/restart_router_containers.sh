#!/bin/bash

# Restart router containers using Ansible
cd "$(dirname "$0")/.."
ansible-playbook -i ansible/inventories/router/hosts.ini ansible/playbooks/maintenance/router_containers_restart.yml --ask-pass
