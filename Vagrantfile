#STORAGE_VMDK='E:/storage.vmdk'
STORAGE_VMDK='/home/sdelcore/storage.vmdk'

Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-18.04"

  #config.vm.network "public_network"
  # Open ports
  # portainer
  config.vm.network "forwarded_port", guest: 9000, host: 9000
  # transmission
  config.vm.network "forwarded_port", guest: 9091, host: 9091
  # plex
  config.vm.network "forwarded_port", guest: 32400, host: 32400
  config.vm.network "forwarded_port", guest: 3005, host: 3005
  config.vm.network "forwarded_port", guest: 8324, host: 8324
  config.vm.network "forwarded_port", guest: 32469, host: 32469
  config.vm.network "forwarded_port", guest: 33400, host: 33400
  config.vm.network "forwarded_port", guest: 1900, host: 1900, protocol: "udp"
  config.vm.network "forwarded_port", guest: 32410, host: 32410, protocol: "udp"
  config.vm.network "forwarded_port", guest: 32412, host: 32410, protocol: "udp"
  config.vm.network "forwarded_port", guest: 32413, host: 32413 , protocol: "udp" 
  config.vm.network "forwarded_port", guest: 32414, host: 32414, protocol: "udp"    
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
  #config.vm.network "forwarded_port", guest: 33400, host: 33400
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
  config.vm.network "forwarded_port", guest: 8081, host: 80
  
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 3
    
    unless File.exist?(STORAGE_VMDK)
      v.customize ['createhd', '--filename', STORAGE_VMDK, '--size', 2000 * 1000]
    end
    v.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', STORAGE_VMDK]
  end 

  # Install docker
  config.vm.provision :docker

  # Install docker-compose
  config.vm.provision :shell, preserve_order: true, path: "provision/setup.sh", privileged: false
  config.vm.provision :shell, preserve_order: true, path: "provision/partition-storage.sh", privileged: false
  config.vm.provision :file, preserve_order: true, source: "./config", destination: "/opt/server/"
  config.vm.provision :shell, preserve_order: true, path: "provision/mount-storage.sh", run: 'always', privileged: false
  config.vm.provision :shell, preserve_order: true, inline: "cd /vagrant; sudo docker-compose up -d --build", run: 'always', privileged: false

end
