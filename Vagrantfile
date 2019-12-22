# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64" # Ubuntu 18.4 LTS
  config.vm.hostname = 'cc-dev'
  config.vm.network :forwarded_port, guest: 5000, host: 5000
  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true
  config.vm.provider 'virtualbox' do |v|
    v.memory = ENV.fetch('CC_RAM', 2048).to_i
    v.cpus   = ENV.fetch('CC_CPU', 2).to_i
  end
end
