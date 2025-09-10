#!/bin/bash

echo "🔐 Setting up known hosts for secure SSH connections..."

# Add Proxmox host
echo "Adding Proxmox host (78.137.3.68:22101)..."
ssh-keyscan -p 22101 78.137.3.68 >> ~/.ssh/known_hosts 2>/dev/null

# Add container host (after it's created)
echo "Adding container host (192.168.31.13)..."
ssh-keyscan 192.168.31.13 >> ~/.ssh/known_hosts 2>/dev/null

echo "✅ Known hosts setup complete!"
echo "💡 You can now run Ansible without host key prompts"
