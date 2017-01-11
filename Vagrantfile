# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty32"
  config.vm.boot_timeout = 500


  config.vm.provider :virtualbox do |vb|
     # For NAT adapter
    vb.customize ["modifyvm", :id, "--nictype1", "Am79C973"]
    # For host-only adapter
    vb.customize ["modifyvm", :id, "--nictype2", "Am79C973"]
  end

  config.vm.define "slave" do |slave|
    slave.vm.network :private_network, ip: "192.168.33.12", auto_config: false
    slave.vm.provision "shell", inline: <<-SHELL
    rm -f /etc/network/interfaces.d/eth1.cfg
    echo "auto eth1" >> /etc/network/interfaces.d/eth1.cfg
    echo "iface eth1 inet static" >> /etc/network/interfaces.d/eth1.cfg
    echo "address 192.168.33.12" >> /etc/network/interfaces.d/eth1.cfg
    echo "netmask 255.255.255.0" >> /etc/network/interfaces.d/eth1.cfg
    ifdown eth1 && ifup eth1
   SHELL
    slave.vm.provision "shell", path: "slave.sh"
  end

  config.vm.define "master" do |master|
    master.vm.network :private_network, ip: "192.168.33.11"
    master.vm.provision "shell", inline: <<-SHELL
    rm -f /etc/network/interfaces.d/eth1.cfg
    echo "auto eth1" >> /etc/network/interfaces.d/eth1.cfg
    echo "iface eth1 inet static" >> /etc/network/interfaces.d/eth1.cfg
    echo "address 192.168.33.11" >> /etc/network/interfaces.d/eth1.cfg
    echo "netmask 255.255.255.0" >> /etc/network/interfaces.d/eth1.cfg
    ifdown eth1 && ifup eth1
   SHELL
    master.vm.provision "shell", path: "master.sh"
  end
end
