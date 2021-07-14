#
# Get OS images from https://github.com/theprotos/env-generic.git
#

VAGRANTFILE_API_VERSION = "2"
PROJECT = "maven"
DESCRIPTION = "#{PROJECT} lab environment"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

if Vagrant.has_plugin?("vagrant-vbguest")
  config.vbguest.auto_update = false
end

  config.vm.define "node1" do |node1|
    node1.vm.box = "centos/8"
    node1.vm.hostname = "node1"
    #node1.vm.network "private_network", ip: "192.168.200.200"
    node1.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--ioapic", "on"]
      vb.customize ["modifyvm", :id, "--description", "#{DESCRIPTION}"]
      vb.customize ["setextradata", :id, "GUI/HidLedsSync", 0]
    end
    node1.vm.synced_folder ".", "/vagrant", type: "rsync", create: "true"
    node1.vm.provision "shell", inline: <<-SHELL
      # yum update -y
      echo -e "  ==> Install maven"
      yum install maven -yq
      echo -e "  ==> Install and configure tomcat"
      groupadd --system tomcat
      useradd -d /usr/share/tomcat -r -s /bin/false -g tomcat tomcat
      export VER="10.1.0-M2"
      curl https://archive.apache.org/dist/tomcat/tomcat-10/v${VER}/bin/apache-tomcat-${VER}.tar.gz | tar -xz -C /usr/share/
      ln -s /usr/share/apache-tomcat-$VER/ /usr/share/tomcat
      chown -R tomcat:tomcat /usr/share/tomcat
      chown -R tomcat:tomcat /usr/share/apache-tomcat-$VER/
    SHELL
  end
end
