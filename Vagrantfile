# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX_HOSTNAME = "soufe1"
BOX_RAM_MB  = "2048"
BOX_COUNT_CPUS = "1"
BOX_IPADDRESS_EXPOSED = "192.168.56.11"
BOX_OS = "generic/oracle8"

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = BOX_OS
  config.vbguest.auto_update = false

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: BOX_IPADDRESS_EXPOSED

  config.vm.hostname = BOX_HOSTNAME
  config.vm.define BOX_HOSTNAME do |host|
  end

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder ".", "/vagrant"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  #
  # VirtualBox:
  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.name = BOX_HOSTNAME
    vb.customize ["modifyvm", :id, "--memory", BOX_RAM_MB]
    vb.cpus = BOX_COUNT_CPUS
  end
  
  # VMware:
  config.vm.provider :vmware_fusion do |vmw|
    vmw.gui = false
    vmw.vmx["memsize"] = BOX_RAM_MB
    vmw.vmx["numvcpus"] = BOX_COUNT_CPUS
  end

  # Provisioning via Ansible
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "provisioning/playbook.yml"
    # ansible.inventory_path = "provisioning/inventory"
    # ansible.limit = "all"
    ansible.become = true # necessario? presente già nel playbook
  end

end
