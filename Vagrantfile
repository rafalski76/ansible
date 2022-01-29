Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

#   config.vm.network "private_network", type: "dhcp"

  config.vm.provider "virtualbox" do |v|
    v.gui = false
    v.linked_clone = true

    v.check_guest_additions = true
    if Vagrant.has_plugin?("vagrant-vbguest") then
      config.vbguest.auto_update = false
    end

    v.memory = 2048
    v.cpus = 1
  end

  config.vm.define "runner", primary: true do |host|
    host.vm.hostname = "ansibler"
    host.vm.network "private_network", ip: "192.168.56.10"
    host.vm.provision "shell", path: "./.vagrant-provision/install_ansible.sh"
  end

  config.vm.define "target1" do |host|
    host.vm.hostname = "target1"
    host.vm.network "private_network", ip: "192.168.56.11"
#     host.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  end

  config.vm.define "target2" do |host|
    host.vm.hostname = "target2"
    host.vm.network "private_network", ip: "192.168.56.12"
  end

  config.vm.define "target3" do |host|
    host.vm.hostname = "target3"
    host.vm.network "private_network", ip: "192.168.56.13"
  end
end
