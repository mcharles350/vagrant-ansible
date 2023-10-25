# Get the Uptime for each managed node
ansible all -m ansible.bultin.command -a 'uptime'

# Install Package (i.e. install Nginx)
ansible all -m ansible.builtin.package -a 'name=nginx state=present' -b

# Ping server(s) by IP address
ansible <ip_addr> -m ansible.bultin.ping
ansible <ip_addr>,<ip_addr> -m ansible.bultin.ping

# Check how memory the server has
ansible all -m ansible.builtin.command -a 'free -mh' 
# Command module is not executing commands using shell on your managed nodes, instead it uses Python,
# which is why environment variables and also |,>,<, &&, || and ; won't work.
ansible all -m ansible.builtin.command -a 'free -mh;date' # won't work

# A command module is faster than a shell module as it is using Python to execute commands

ansible all -m ansible.builtin.shell -a 'free -mh'
# Shell Module is executing commands using shell on managed nodes, so environment variables and 
# also |, >,<, &&, || and ; work properly

ansible all -m ansible.builtin.shell -a 'free -mh;date'

# Run a command in batch
ansible all -m ansible.builtin.shell -a 'date' -f 1 # this will show 1 managed node at a time.

# Run playbook
ansible-playbook demo.yml