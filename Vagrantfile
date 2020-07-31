Vagrant.configure("2") do |config|
    #config.vm.box = "hyperledger/fabric-baseimage"
    config.vm.box = "bento/ubuntu-16.04"
    
    config.vm.provider "virtualbox" do |vb|
      vb.name = "my_vm1"
      vb.memory = 4096
    end

    config.vm.provision "shell", path: "test.sh"
  end