STORAGE_VMDK='H:/storage.vmdk'
NEXTCLOUD_VHD='E:/server/nextcloud.vhd'
CONFIG_VMDK='E:/server/config.vmdk'
#NEXTCLOUD_VHD='E:/server/disks/nextcloud/nextcloud.vhd'
#CONFIG_VMDK='E:/server/disks/config/config.vmdk'

Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-18.04"

  #Open ports
  ##config.vm.network "forwarded_port", guest: 22, host: 2222, host_ip: "127.0.0.1", id: 'ssh'
  # portainer
  config.vm.network "forwarded_port", guest: 9000, host: 9000
  # transmission
  config.vm.network "forwarded_port", guest: 9091, host: 9091
  config.vm.network "forwarded_port", guest: 41742, host: 41742
  config.vm.network "forwarded_port", guest: 41742, host: 41742, protocol: "udp"
  # plex
  # config.vm.network "forwarded_port", guest: 32400, host: 32400
  # config.vm.network "forwarded_port", guest: 3005, host: 3005
  # config.vm.network "forwarded_port", guest: 8324, host: 8324
  # config.vm.network "forwarded_port", guest: 32469, host: 32469
  # config.vm.network "forwarded_port", guest: 33400, host: 33400
  # config.vm.network "forwarded_port", guest: 1900, host: 1900, protocol: "udp"
  # config.vm.network "forwarded_port", guest: 32410, host: 32410, protocol: "udp"
  # config.vm.network "forwarded_port", guest: 32412, host: 32410, protocol: "udp"
  # config.vm.network "forwarded_port", guest: 32413, host: 32413 , protocol: "udp" 
  # config.vm.network "forwarded_port", guest: 32414, host: 32414, protocol: "udp"    
  # tautulli
  config.vm.network "forwarded_port", guest: 8181, host: 8181
  # sonarr
  config.vm.network "forwarded_port", guest: 8989, host: 8989
  # radarr
  config.vm.network "forwarded_port", guest: 7878, host: 7878
  # jackett
  config.vm.network "forwarded_port", guest: 9117, host: 9117
  # ubooquity
  config.vm.network "forwarded_port", guest: 2202, host: 2202
  config.vm.network "forwarded_port", guest: 2203, host: 2203
  # ombi
  config.vm.network "forwarded_port", guest: 3579, host: 3579
  # netdata
  #config.vm.network "forwarded_port", guest: x, host: x
  # mylar
  config.vm.network "forwarded_port", guest: 8090, host: 8090
  # organizr
  config.vm.network "forwarded_port", guest: 80, host: 80
  # home assistant
  config.vm.network "forwarded_port", guest: 8123, host: 8123
  # mariadb
  config.vm.network "forwarded_port", guest: 3306, host: 3306
  # nextcloud
  config.vm.network "forwarded_port", guest: 443, host: 443
  # phpmyadmin
  config.vm.network "forwarded_port", guest: 8081, host: 8081
  # registry
  config.vm.network "forwarded_port", guest: 5000, host: 5000
  # registry
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  # samba
  config.vm.network "forwarded_port", guest: 139, host: 139
  config.vm.network "forwarded_port", guest: 445, host: 445
  config.vm.network "forwarded_port", guest: 138, host: 138, protocol: "udp"
  config.vm.network "forwarded_port", guest: 137, host: 137, protocol: "udp"
  # openvpn home
  #config.vm.network "forwarded_port", guest: 943, host: 943
  config.vm.network "forwarded_port", guest: 41739, host: 41739
  config.vm.network "forwarded_port", guest: 41740, host: 41740
  config.vm.network "forwarded_port", guest: 41741, host: 41741, protocol: "udp"
  #open vpn oakville
  config.vm.network "forwarded_port", guest: 35611, host: 35611
  config.vm.network "forwarded_port", guest: 35612, host: 35612
  config.vm.network "forwarded_port", guest: 35613, host: 35613, protocol: "udp"
  
  
  config.vm.network "private_network", :type => 'dhcp', :adapter => 2
  
  #config.vm.synced_folder ".","/vagrant", type: "smb", smb_username: "Spencer Delcore", smb_password: "carnage00", smb_host: "192.168.0.108" 
  
  config.vm.provider "virtualbox" do |v|
	v.name = "server"
    v.cpus = 4
	#v.memory = 8192
	v.memory = 4096
	v.linked_clone = true
	    
	# unless File.exist?(STORAGE_VMDK)
      # v.customize ['createhd', '--filename', STORAGE_VMDK, '--size', 2000 * 1000]
	  # #these call the appropreate mount scripts directly since these will run after the mount provisioners
	  # config.vm.provision :shell, path: "provision/partition-storage.sh", privileged: false
    # end
	# unless File.exist?(NEXTCLOUD_VMDK)
	  # v.customize ['createhd', '--filename', NEXTCLOUD_VMDK, '--size', 2000 * 1000]
	  # #these call the appropreate mount scripts directly since these will run after the mount provisioners
	  # config.vm.provision :shell, path: "provision/partition-nextcloud.sh", privileged: false
    # end
	# unless File.exist?(CONFIG_VMDK)
	  # v.customize ['createhd', '--filename', CONFIG_VMDK, '--size', 250 * 1000]
	  # #these call the appropreate mount scripts directly since these will run after the mount provisioners
	  # config.vm.provision :shell, path: "provision/partition-config.sh", privileged: false
    # end
	
    v.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', STORAGE_VMDK]
	v.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', NEXTCLOUD_VHD]
	v.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 3, '--device', 0, '--type', 'hdd', '--medium', CONFIG_VMDK]
  end 
   

  ### Install docker
  config.vm.provision :docker

  ## Install docker-compose
  config.vm.provision :shell, preserve_order: true, inline: "cp /vagrant/provision/fstab /etc/fstab"
  config.vm.provision :shell, preserve_order: true, inline: "systemctl disable systemd-networkd-wait-online.service"
  config.vm.provision :shell, preserve_order: true, inline: "systemctl mask systemd-networkd-wait-online.service"
  config.vm.provision :shell, preserve_order: true, path: "provision/setup.sh", privileged: false
  config.vm.provision :shell, preserve_order: true, inline: "cd /vagrant/docker-files/management-server; sudo docker-compose down --rmi 'all'; sudo docker-compose up -d", privileged: false
  ### config.vm.provision :shell, preserve_order: true, inline: "cd /vagrant/docker-files/development-server; sudo docker-compose down --rmi 'all'; sudo docker-compose up -d", run: 'always', privileged: false
  config.vm.provision :shell, preserve_order: true, inline: "cd /vagrant/docker-files/devops-server; sudo docker-compose down --rmi 'all'; sudo docker-compose up -d", privileged: false
  config.vm.provision :shell, preserve_order: true, inline: "cd /vagrant/docker-files/file-server; sudo docker-compose down --rmi 'all'; sudo docker-compose up -d", privileged: false
  config.vm.provision :shell, preserve_order: true, inline: "cd /vagrant/docker-files/home-automation-server; sudo docker-compose down --rmi 'all'; sudo docker-compose up -d", privileged: false
  config.vm.provision :shell, preserve_order: true, inline: "cd /vagrant/docker-files/media-server; sudo docker-compose down --rmi 'all'; sudo docker-compose up -d", privileged: false
  

end
