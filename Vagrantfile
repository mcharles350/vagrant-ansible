# -*- mode: ruby -*-
# vi: set ft=ruby :

# Provision
$ansible_main = <<-SCRIPT
apt-get update && apt-get upgrade -y
apt-get install software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt-get install ansible -y
SCRIPT

$ubuntu = <<-SCRIPT
apt-get update && apt-get upgrade -y
SCRIPT

$centos = <<-SCRIPT
yum update -y
yum install epel-release -y
SCRIPT

# OS 
$debian = "ubuntu/trusty64"
$rhel = "centos/7"

# API Version
VAGRANTFILE_API_VERSION = "2"

# Builds
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :first do |box1|
    box1.vm.box = $debian
    box1.vm.hostname = "ansible-con"
    # config.vm.box_check_update = false
    # config.vm.network "forwarded_port", guest: 80, host: 8080

    # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

    box1.vm.network "private_network", ip: "10.0.2.10"

    # config.vm.network "public_network"

    box1.vm.synced_folder "data", "/vagrant_data"

    box1.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.memory = "1024"
    end

    box1.vm.provision "shell", inline: $ansible_main
  end

  config.vm.define :second do |box2|
    box2.vm.box = $debian
    box2.vm.hostname = "ansible-node1"
    # config.vm.box_check_update = false
    # config.vm.network "forwarded_port", guest: 80, host: 8080

    # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

    box2.vm.network "private_network", ip: "10.0.2.12"

    # config.vm.network "public_network"

    box2.vm.synced_folder "data", "/vagrant_data"

    box2.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.memory = "1024"
    end

    box2.vm.provision "shell", inline: $ubuntu
  end

  config.vm.define :third do |box3|
    box3.vm.box = $rhel
    box3.vbguest.installer_options = { allow_kernel_upgrade: true }
    box3.vm.hostname = "ansible-node2"
    # config.vm.box_check_update = false
    # config.vm.network "forwarded_port", guest: 80, host: 8080

    # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

    box3.vm.network "private_network", ip: "10.0.2.14"

    # config.vm.network "public_network"

    box3.vm.synced_folder "data", "/vagrant_data"

    box3.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.memory = "2048"
    end

    box3.vm.provision "shell", inline: $centos
  end
end  