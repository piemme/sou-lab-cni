# -*- mode: ruby -*-
# vi: set ft=ruby :

nodes = {
  'soufe1' => {
    :box => 'generic/oracle8',
    :ip => '192.168.56.11',
    :cpu => 1,
    :ram => 2048
  },
  'soube2' => {
    :box => 'generic/oracle8',
    :ip => '192.168.56.12',
    :cpu => 1,
    :ram => 2048
  }
}

Vagrant.configure("2") do |config|

  nodes.each do |name, confs|

    config.vm.define name do |machine|

      machine.vm.box = confs[:box]
      machine.vbguest.auto_update = false
  
      # Create a private network, which allows host-only access to the machine
      # using a specific IP.
      machine.vm.network "private_network", ip: confs[:ip]
  
      machine.vm.hostname = name
      machine.vm.define name do |host|
      end
  
      # Share an additional folder to the guest VM
      machine.vm.synced_folder ".", "/vagrant"
  
      # Provider-specific fe1uration so you can fine-tune various
      # backing providers for Vagrant. These expose provider-specific options.
      
      # VirtualBox:
      machine.vm.provider :virtualbox do |vb|
        vb.gui = false
        vb.name = name
        vb.customize ["modifyvm", :id, "--memory", confs[:ram]]
        vb.cpus = confs[:cpu]
      end
      
      # VMware:
      machine.vm.provider :vmware_fusion do |vmw|
        vmw.gui = false
        vmw.vmx["memsize"] = confs[:ram]
        vmw.vmx["numvcpus"] = confs[:cpu]
      end

      # Provisioning via Ansible
      machine.vm.provision "ansible" do |ansible|
        ansible.playbook = "provisioning/playbook.yml"
        ansible.become = true # necessario? presente già nel playbook
        ansible.verbose = "v"
      end

    end
  end
end
