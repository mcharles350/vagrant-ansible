# -*- mode: ruby -*-
# vi: set ft=ruby :

# Provision
$ansible_main = <<-SCRIPT
yum update -y
yum install epel-release -y
cat /home/vagrant/.ssh/authorized_keys > /vagrant_data/controller_keys
#cp -f /vagrant_data/hosts /etc/ansible/hosts
SCRIPT

$centos = <<-SCRIPT
yum update -y
yum install epel-release -y
#cat /vagrant_data/controller_keys >> /home/vagrant/.ssh/authorized_keys
SCRIPT

# OS 
$box = "generic/centos9s"

# API Version
VAGRANTFILE_API_VERSION = "2"

# Builds
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :controller do |box1|
    box1.vm.box = $box
    box1.vm.hostname = "ansible"
    # config.vm.box_check_update = false
    # config.vm.network "forwarded_port", guest: 80, host: 8080

    # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

    box1.vm.network "private_network", type: "dhcp"

    # config.vm.network "public_network"

    box1.vm.synced_folder "data", "/vagrant_data"

    box1.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.memory = "1024"
    end

    box1.vm.provision "shell", inline: $ansible_main
  end

  config.vm.define :node1 do |box2|
    box2.vm.box = $box
    box2.vm.hostname = "node1"
    # config.vm.box_check_update = false
    # config.vm.network "forwarded_port", guest: 80, host: 8081, auto_correct: true

    # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

    box2.vm.network "private_network", type: "dhcp"

    #box2.vm.network "public_network"

    box2.vm.synced_folder "data", "/vagrant_data"

    box2.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.memory = "1024"
    end

    box2.vm.provision "shell", inline: $centos
  end

  config.vm.define :node2 do |box3|
    box3.vm.box = $box
    box3.vm.hostname = "node2"
    # config.vm.box_check_update = false
    # config.vm.network "forwarded_port", guest: 80, host: 8081, auto_correct: true

    # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

    box3.vm.network "private_network", type: "dhcp"

    #box3.vm.network "public_network"

    box3.vm.synced_folder "data", "/vagrant_data"

    box3.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.memory = "1024"
    end

    box3.vm.provision "shell", inline: $centos
  end
end  