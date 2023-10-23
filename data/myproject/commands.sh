# Get the Uptime for each managed node
ansible all -m ansible.bultin.command -a 'uptime'

# Install Package (i.e. install Nginx)
ansible all -m ansible.builtin.package -a 'name=nginx state=present' -b

# Run playbook
ansible-playbook demo.yml