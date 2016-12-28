# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"


$dev_setup = <<SCRIPT
#apt-get update
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
  end
  config.vm.define :master do |master_config|
    master_config.vm.box = 'debian/jessie64'
    master_config.vm.host_name = 'master.local'
    master_config.vm.network 'private_network', ip: '192.168.50.10'
    master_config.vm.synced_folder './', '/vagrant', type: 'virtualbox'
    master_config.vm.synced_folder './saltstack', '/srv', type: 'virtualbox'

    master_config.vm.provision :salt do |salt|
      salt.master_config = 'salt_configs/etc/master'
      salt.master_key = 'salt_configs/keys/master_minion.pem'
      salt.master_pub = 'salt_configs/keys/master_minion.pub'
      salt.minion_key = 'salt_configs/keys/master_minion.pem'
      salt.minion_pub = 'salt_configs/keys/master_minion.pub'
      salt.seed_master = {
                          'minion1' => 'salt_configs/keys/minion1.pub',
                          'minion2' => 'salt_configs/keys/minion2.pub'
                         }

      salt.minion_config = 'salt_configs/etc/minion_master'
      salt.install_type = 'stable'
      salt.install_master = true
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = '-P -c /tmp'
      salt.version = '2016.11.0'

    end

    config.vm.provision "shell", inline: $dev_setup
  end

  config.vm.define :minion1 do |minion_config|
    minion_config.vm.box = 'debian/jessie64'
    minion_config.vm.host_name = 'minion1.local'
    minion_config.vm.network 'private_network', ip: '192.168.50.11'

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = 'salt_configs/etc/minion1'
      salt.minion_key = 'salt_configs/keys/minion1.pem'
      salt.minion_pub = 'salt_configs/keys/minion1.pub'
      salt.install_type = 'stable'
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = '-P -c /tmp'
      salt.version = '2016.11.0'
    end

    config.vm.provision "shell", inline: $dev_setup
  end

  config.vm.define :minion2 do |minion_config|
    minion_config.vm.box = 'debian/jessie64'
    # The following line can be uncommented to use Centos
    # instead of Ubuntu.
    # Comment out the above line as well
    #minion_config.vm.box = 'bento/centos-7.2'
    minion_config.vm.host_name = 'minion2.local'
    minion_config.vm.network 'private_network', ip: '192.168.50.12'

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = 'salt_configs/etc/minion2'
      salt.minion_key = 'salt_configs/keys/minion2.pem'
      salt.minion_pub = 'salt_configs/keys/minion2.pub'
      salt.install_type = 'stable'
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = '-P -c /tmp'
    end

    config.vm.provision "shell", inline: $dev_setup


  end

end
