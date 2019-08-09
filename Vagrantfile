Vagrant.configure("2") do |config|

   config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]

  end
  config.vm.define "master" do |subconfig|
    subconfig.vm.box = "bento/ubuntu-18.04"
    subconfig.vm.hostname = "master"
    subconfig.vm.network :private_network, ip: "10.0.0.10"
  end

  config.vm.define "node1" do |subconfig|
    subconfig.vm.box = "bento/ubuntu-18.04"
    subconfig.vm.hostname = "node1"
    subconfig.vm.network :private_network, ip: "10.0.0.11"
  end

  config.vm.define "node2" do |subconfig|
    subconfig.vm.box = "bento/ubuntu-18.04"
    subconfig.vm.hostname = "node2"
    subconfig.vm.network :private_network, ip: "10.0.0.12"
  end

  # Install avahi on all machines     
  config.vm.provision "shell", inline: <<-SHELL     
   sudo apt-get -y update
   sudo apt-get -y install  apt-transport-https ca-certificates curl software-properties-common
   sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
   sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable edge test"
   sudo apt-get -y update 
   sudo apt-get -y install docker-ce
   apt-cache madison docker-ce
   sudo echo "10.0.0.10       master" >> /etc/hosts
   sudo echo "10.0.0.11       node1"  >> /etc/hosts
   sudo echo "10.0.0.12       node2"  >> /etc/hosts
  SHELL
  config.vm.provider :virtualbox do |vb|
  vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
end
end
