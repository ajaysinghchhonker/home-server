#!/bin/bash

# Updating
sudo apt-get -y -qq install curl

echo 'Installing docker-compose'
if (! test -e /usr/local/bin/docker-compose)
then
  sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose > /dev/null
  sudo chmod +x /usr/local/bin/docker-compose
  sudo usermod -aG docker $USER
  sudo 
fi

if (! test -e /etc/bash_completion.d/docker-compose)
then
  sudo curl -L https://raw.githubusercontent.com/docker/compose/1.23.2/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose > /dev/null
fi

echo "Setting up server folders for user: $(whoami)"
sudo mkdir -p /opt/server
sudo chown -R $USER:$USER /opt/server
sudo chmod -R 775 /opt/server
