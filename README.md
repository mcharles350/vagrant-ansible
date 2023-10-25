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

# Ad-hoc Commands
- Ansible Ad-hoc commands starts with <b>ansible</b> command
- Example: ansible <host-pattern> -m <moduleName> [<-a arguments>]

# List Available Modules
- Command: ansible-doc -l
- Command: ansible-doc -l | wc -l # count how many modules
- Command: ansible-doc -l | grep <module/SearchString> # Search for required module
- Command: ansible-dock <moduleName> # Get help/documentation for your required module

# Backend Story while Executing Ansible Ad-hoc commands
- Ansible reads the list of managed servers from inventory file
- Ansible connects to the managed nodes using SSH with current logged-in user
- Ansible pushes our module to remote nodes (~/.ansible) and executes the task on managed node itself using Python and it deletes the pushed module once task is completed.
- Ansible usses batches for task execution, which are controlled by a parameter called forks
- The default valude for forks is 5, that means Ansible executes a task on the first five managed nodes parallelly and waits for the task to complete, and then the next five nodes, and so on.
- This default forks can be changed using
  - Environment variable: export ANSIBLE_FORKS=requiredBatchSize
  - By Passing -f required BatchSize in ansible Ad-hoc commands
  - By keeping default value in ansible.cfg with forks=requiredBatchSize
  
- NOTE: We need 1GB per 10 forks + 2GB reservation for an Ansible Controller
