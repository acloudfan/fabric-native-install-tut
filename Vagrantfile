$script = <<-SCRIPT

echo "cd /vagrant" >> /home/vagrant/.profile
echo "All good!!"
SCRIPT

Vagrant.configure("2") do |config|

    config.vm.box = "bento/ubuntu-16.04"

    config.ssh.username = 'vagrant'
    config.ssh.password = 'vagrant'
    config.ssh.insert_key = 'true'


    # This gets executed for both vm1 & vm2
    config.vm.provision "shell", inline:  $script

    config.vm.provider :virtualbox do |vb|
      # Change the memory here if needed - 2 Gb memory on Virtual Box VM
      vb.customize ["modifyvm", :id, "--memory", "2048", "--cpus", "1"]
      # Change this only if you need destop for Ubuntu - you will need more memory
      vb.gui = false

    end

  end