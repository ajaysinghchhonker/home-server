# Server
This is my own personal home server setup. I currently run the docker containers directly on my PC, but I'm keeping the vagrant files here in case I ever want to go back.

# Overview
Uses Vagrant to create a VM server powered by multiple docker containers.

This is because I don't have a dedicated server and I run it on my main desktop. It allows me to seperate it from my other files and be able to easily move it.

`./config` contains configuration data for the docker containers, when provisioned vagrant copies the content into the proper directory

A storage disk is created for the containers to put all the non-config files. 

# Running
The only programs needed to run it are:
  1. virtualbox
  2. vagrant
  
In the root dir of the project simply run, you will have to restart the VM once it initializes so that the drives can mount.

```
vagrant up
```
