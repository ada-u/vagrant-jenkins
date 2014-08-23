# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.hostname = "jenkins.local"

  config.vm.provider :virtualbox do |vbox|
    vbox.customize ["modifyvm", :id, "--cpus", "2"]
    vbox.customize ["modifyvm", :id, "--memory", "2048"]

    vbox.customize ["modifyvm", :id, "--ioapic", "on"]

    # Disable nat dns proxy
    vbox.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    vbox.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]

    # Disabling the Guest Additions time synchronization
    vbox.customize ["setextradata", :id, "VBoxInternal/Devices/VMMDev/0/Config/GetHostTimeDisabled", 1]
  end

  # Network
  config.vm.network :private_network, ip:"192.168.33.21"

  # Shared
  config.vm.synced_folder ".", "/vagrant", :nfs => { :mount_options => ["dmode=755","fmode=775"] }

  # Provisioning
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "provisioning/site.yml"
    ansible.inventory_path = "provisioning/development"
    ansible.host_key_checking = false
    ansible.limit = 'all'
  end
end
