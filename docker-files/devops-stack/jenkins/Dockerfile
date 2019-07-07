FROM jenkins/jenkins:latest

ARG DOCKER_GID=996

USER root

RUN apt-get update \
      && apt-get install -y sudo \
      && apt-get -y install lxc nano apt-transport-https ca-certificates curl gnupg2 software-properties-common \
	  && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey \
	  && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" \
      && apt-get update \
      && apt-get -y install docker-ce
RUN rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN groupmod -g ${DOCKER_GID} docker
#RUN groupadd  -g ${DOCKER_GID} docker 
RUN usermod -aG docker jenkins
RUN chown -R jenkins:jenkins /var/jenkins_home
RUN mkdir -p /etc/docker && echo "{\"insecure-registries\": [\"10.0.0.5:5000\", \"registry:5000\"]}" > /etc/docker/daemon.json

#USER jenkins
 
