#!/bin/bash

echo "🔑 Setting up SSH Agent for Ansible..."

# Start SSH agent if not running
if ! pgrep -x "ssh-agent" > /dev/null; then
    echo "Starting SSH agent..."
    eval "$(ssh-agent -s)"
fi

# Add default SSH key if it exists
if [ -f ~/.ssh/id_ed25519 ]; then
    echo "Adding ~/.ssh/id_ed25519 to SSH agent..."
    ssh-add ~/.ssh/id_ed25519
elif [ -f ~/.ssh/id_rsa ]; then
    echo "Adding ~/.ssh/id_rsa to SSH agent..."
    ssh-add ~/.ssh/id_rsa
else
    echo "⚠️  No default SSH key found. Please add your key manually:"
    echo "   ssh-add ~/.ssh/your_key"
fi

# Show loaded keys
echo ""
echo "📋 Currently loaded SSH keys:"
ssh-add -l

echo ""
echo "✅ SSH Agent setup complete!"
echo "💡 To add more keys: ssh-add ~/.ssh/your_key"
echo "💡 To list keys: ssh-add -l"
echo "💡 To remove a key: ssh-add -d ~/.ssh/your_key"
