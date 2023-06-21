# -*- mode: ruby -*-
# vi: set ft=ruby :

FE_BOX_HOSTNAME = "soufe1"
FE_BOX_RAM_MB  = "2048"
FE_BOX_COUNT_CPUS = "1"
FE_BOX_IPADDRESS_EXPOSED = "192.168.56.11"
FE_BOX_OS = "generic/oracle8"

BE_BOX_HOSTNAME = "soube2"
BE_BOX_RAM_MB  = "2048"
BE_BOX_COUNT_CPUS = "1"
BE_BOX_IPADDRESS_EXPOSED = "192.168.56.12"
BE_BOX_OS = "generic/oracle8"

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.define "soufe1" do |fe1|
    # Every Vagrant virtual environment requires a box to build off of.
    fe1.vm.box = FE_BOX_OS
    fe1.vbguest.auto_update = false

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    fe1.vm.network "private_network", ip: FE_BOX_IPADDRESS_EXPOSED

    fe1.vm.hostname = FE_BOX_HOSTNAME
    fe1.vm.define FE_BOX_HOSTNAME do |host|
    end

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    fe1.vm.synced_folder ".", "/vagrant"

    # Provider-specific fe1uration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    #
    # VirtualBox:
    fe1.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.name = FE_BOX_HOSTNAME
      vb.customize ["modifyvm", :id, "--memory", FE_BOX_RAM_MB]
      vb.cpus = FE_BOX_COUNT_CPUS
    end
    
    # VMware:
    fe1.vm.provider :vmware_fusion do |vmw|
      vmw.gui = false
      vmw.vmx["memsize"] = FE_BOX_RAM_MB
      vmw.vmx["numvcpus"] = FE_BOX_COUNT_CPUS
    end

  end

  config.vm.define "soube2" do |be2|
    # Every Vagrant virtual environment requires a box to build off of.
    be2.vm.box = BE_BOX_OS
    be2.vbguest.auto_update = false

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    be2.vm.network "private_network", ip: BE_BOX_IPADDRESS_EXPOSED

    be2.vm.hostname = BE_BOX_HOSTNAME
    be2.vm.define BE_BOX_HOSTNAME do |host|
    end

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    be2.vm.synced_folder ".", "/vagrant"

    # Provider-specific confiration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    #
    # VirtualBox:
    be2.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.name = BE_BOX_HOSTNAME
      vb.customize ["modifyvm", :id, "--memory", BE_BOX_RAM_MB]
      vb.cpus = BE_BOX_COUNT_CPUS
    end
    
    # VMware:
    be2.vm.provider :vmware_fusion do |vmw|
      vmw.gui = false
      vmw.vmx["memsize"] = BE_BOX_RAM_MB
      vmw.vmx["numvcpus"] = BE_BOX_COUNT_CPUS
    end

  end  

  # Provisioning via Ansible
  # config.vm.provision "ansible" do |ansible|
    # ansible.verbose = "v"
    # ansible.playbook = "provisioning/playbook.yml"
    # ansible.inventory_path = "provisioning/inventory"
    # ansible.limit = "all"
    # ansible.become = true # necessario? presente già nel playbook
  # end

end
