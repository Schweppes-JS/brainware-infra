# Common Role

This role provides common configuration for all hosts in the infrastructure.

## What it does

- Updates package cache
- Installs common packages (curl, wget, vim, htop)
- Creates admin user with sudo access
- Configures SSH keys for admin user
- Sets up sudo configuration
- Restarts SSH service

## Usage

### Basic usage

```yaml
- hosts: all
  roles:
    - common
```

### With custom variables

```yaml
- hosts: all
  vars:
    ssh_public_keys: "ssh-ed25519... your_key_here"
    admin_shell: /bin/ash # For Alpine
  roles:
    - common
```

### In a playbook

```yaml
- name: Configure all hosts
  hosts: all
  become: true
  vars:
    ssh_public_keys: "{{ ssh_public_keys }}"
  roles:
    - common
```

## Variables

| Variable           | Default             | Description                             |
| ------------------ | ------------------- | --------------------------------------- |
| `admin_shell`      | `/bin/bash`         | Shell for admin user                    |
| `admin_groups`     | `['wheel', 'sudo']` | Groups for admin user                   |
| `ssh_service_name` | `sshd`              | SSH service name                        |
| `ssh_public_keys`  | undefined           | Comma-separated list of SSH public keys |

## OS Support

- **Alpine**: Uses `apk` package manager, `/bin/ash` shell, `wheel` group
- **Ubuntu/Debian**: Uses `apt` package manager, `/bin/bash` shell, `sudo` group
- **CentOS/RHEL**: Uses `yum`/`dnf` package manager, `/bin/bash` shell, `wheel` group

## Dependencies

None

