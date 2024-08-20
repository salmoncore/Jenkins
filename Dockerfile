FROM jenkins/jenkins:2.462.1-jdk17

USER root

RUN apt-get update && \
    apt-get install -y lsb-release maven zip

RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
    https://download.docker.com/linux/debian/gpg

RUN echo "deb [arch=$(dpkg --print-architecture) \
    signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
    https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -

RUN apt-get update && \
    apt-get install -y docker-ce-cli nodejs kubernetes-client

RUN export M2_HOME=/usr/bin/mvn && \
    export MAVEN_HOME=/usr/bin/mvn

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

RUN unzip awscliv2.zip

RUN apt install docker.io -y

RUN ./aws/install

RUN jenkins-plugin-cli --plugins "maven-plugin workflow-aggregator git sonar nodejs kubernetes aws-credentials docker-workflow ssh-agent email-ext blueocean pipeline-aws docker-plugin"
