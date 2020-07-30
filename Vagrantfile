Vagrant.configure("2") do |config|
    config.vm.box = "hyperledger/fabric-baseimage"
    
    config.vm.provider "virtualbox" do |vb|
      vb.name = "my_vm"
      vb.memory = 4096
    end

    config.vm.provision "shell", path: "bootstrap.sh"
  end