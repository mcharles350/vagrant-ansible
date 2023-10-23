# Install Python3 Pip
- Command: yum install python3-pip -y

# Create User
- Command: useradd -s /bin/bash -m -d /home/ansadmin ansadmin

# Provide Root Privilages to ansadmin user
- Edit /etc/sudoers file and add the below line
    ansadmin ALL=(ALL)    NOPASSWD: ALL

# Generate SSH Keys:
- Command: ssh-keygen
- Set permissions for 600
  - create .ssh under user's home of managed nodes
  - Command: chmod 600 authorized_keys

# Test connection
- Command: ansible all -m ping or ansible all -m ansible.builtin.ping

# Project Directory
- Create an inventory file with any name - it should have the IPs/FQDNs of managed nodes
- Create ansible.cfg
