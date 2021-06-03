Vagrant.configure("2") do |config|
  #config.vm.box = "mclanem/m3toolbox"
  #config.vm.box_version = "0"
  config.vm.box = ".\\toolbox_image\\output-vagrant\\m3toolbox-virtualbox-ubuntu18.04.4.v3.box" 
 
  config.vm.network "private_network", type: "dhcp"
  config.vm.hostname = "toolbox"
  config.vm.boot_timeout = 600
  config.vm.box_check_update = true
  config.vm.post_up_message = "All set to run \"vagrant ssh\" to connect."  
  config.ssh.connect_timeout = 60
 
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
  
    # Customize the VM:
    vb.memory = "4096"
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"] # Insures SymLinks work on windows
    
    # Optimizations
    vb.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ] # Controls how VirtualBox connects a given virtual serial port
    vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000 ]
  end

  # config.vm.provision "file", source: "~/.aws", destination: "/home/vagrant/.aws"
  # if ENV['PACKER_SSH_KEY_PATH']
  #   config.vm.provision "file", source: "#{ENV['PACKER_SSH_KEY_PATH']}", destination: "/home/vagrant/.aws/#{File.basename(ENV['PACKER_SSH_KEY_PATH'])}"
  # end
  config.vm.provision "file", source: "~/.ssh/id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
  config.vm.provision :shell, privileged: true, inline: "chmod 600 /home/vagrant/.ssh/id_rsa"
  config.vm.synced_folder "synced", "/host", disabled: false, :mount_options => ['dmode=0755', 'fmode=0774']
  config.vm.provision "file", source: "kubeconfig", destination: "/home/vagrant/.kube/config"
  config.vm.provision :shell, privileged: true, inline: "chmod 600 /home/vagrant/.kube/config"
  # Setup Chef Knife
  # config.vm.provision "file", source: "./knife.rb", destination: "/home/vagrant/.chef/knife.rb"
  # if ENV['KNPEM_PATH']
  #   config.vm.provision "file", source: "#{ENV['KNPEM_PATH']}", destination: "/home/vagrant/.chef/knife.pem"
  # end
  # config.vm.provision :shell, privileged: true, inline: "knife ssl fetch"

  # Setup and configure zsh
  config.vm.provision :shell, privileged: false, path: "zsh/setup_zsh.sh"
  config.vm.provision "file", source: "zsh/.zshrc", destination: ".zshrc"
  config.vm.provision :shell, privileged: true, inline: "chsh -s /bin/zsh vagrant" # Set zsh as the shell
  
  # Run custimizations
  config.vm.provision :shell, privileged: false, path: "./customizations.sh"
  config.vm.provision :shell, privileged: false, path: "./provision.sh"
end