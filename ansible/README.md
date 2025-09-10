# Ansible Configuration

This directory contains Ansible playbooks and configurations for post-Terraform container setup.

## Structure

```
ansible/
├── inventories/
│   └── development/
│       └── hosts.ini          # Host inventory for development
├── playbooks/
│   └── configure_alpine_containers.yml  # Main configuration playbook
├── roles/                     # Reusable roles (future use)
└── ansible.cfg               # Ansible configuration
```

## Team Setup (SSH Agent)

For team collaboration, we use SSH agent to handle multiple developer keys:

### 1. Setup SSH Agent

```bash
# Run the setup script
./setup_ssh_agent.sh

# Or manually:
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/your_key
```

### 2. Add Your SSH Key

```bash
# Add your personal key
ssh-add ~/.ssh/id_ed25519

# Add multiple keys if needed
ssh-add ~/.ssh/work_key
ssh-add ~/.ssh/personal_key

# List loaded keys
ssh-add -l
```

### 3. Update Terraform with Your Public Key

Add your public key to `terraform/envs/development/terraform.tfvars`:

```hcl
ssh_public_keys = "ssh-ed25519... your_email@company.com,ssh-ed25519... teammate@company.com"
```

## Usage

### Manual Deployment

1. **Setup SSH Agent:**

   ```bash
   ./setup_ssh_agent.sh
   ```

2. **Deploy infrastructure with Terraform:**

   ```bash
   cd terraform/envs/development
   terraform apply
   ```

3. **Wait for containers to be ready (60 seconds)**

4. **Run Ansible configuration:**
   ```bash
   cd ansible
   ansible-playbook playbooks/configure_alpine_containers.yml
   ```

### Automated Deployment

Use the deployment script from the root directory:

```bash
./deploy_development.sh
```

## What the Playbook Does

1. **First play (proxmox host):**

   - Waits for containers to be accessible on SSH port
   - Uses `pct exec` to install SSH and UFW on containers

2. **Second play (containers):**

   - Updates package cache
   - Installs additional packages (curl, wget, vim, htop)
   - Creates admin user with sudo access
   - Configures SSH keys for admin user
   - Restarts SSH service

## SSH Access

After deployment, you can SSH to containers:

```bash
ssh admin@192.168.31.13  # development-gitlab
```

## Prerequisites

- Ansible installed on your local machine
- SSH access to Proxmox host (192.168.31.10)
- Your SSH key added to SSH agent
- Terraform has created the containers with SSH keys injected

## Team Workflow

1. **New team member joins:**

   - Run `./setup_ssh_agent.sh`
   - Add their public key to `terraform.tfvars`
   - Deploy with `terraform apply`

2. **Multiple developers:**

   - Each adds their key to SSH agent
   - All keys are injected into containers
   - Ansible automatically uses available keys

3. **Key rotation:**
   - Update keys in `terraform.tfvars`
   - Redeploy containers
   - Update SSH agent keys
