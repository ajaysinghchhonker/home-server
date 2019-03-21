# Creating Server

Uses Vagrant to create a VM server powered by multiple docker containers.

This is because I don't have a dedicated server and I run it on my main desktop. It allows me to seperate it from my other files and be able to easily move it.

When creating the VM, it creates three drives: storage, config, and nextcloud.
  - storage is the maine storage for downloads, tv, movies, docker registries, comics, etc.
    - mapped to `/opt/server/storage`
  - config is the configuration files for each of the containers
    - mapped to `/opt/server/config`
  - nextcloud is the storage for nextcloud
    - mapped to `/opt/server/nextcloud`

# Running
The only programs needed to run it are:
  1. virtualbox
  2. vagrant
  
In the root dir, there is a `.env.template` modify and copy it to each docker-compose.yml locations.

In the root dir of the project simply run

```
vagrant up
```

# List of Docker containers
  - jenkins
  - registery
  - mariadb
  - nextcloud
  - phpmyadmin
  - homeassistant
  - portainer
  - watchtower
  - organizr
  - transmission
  - plex
  - ombi
  - tautulli
  - sonnar
  - jackett
  - ubooquity
  - mylar
