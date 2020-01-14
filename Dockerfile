FROM jenkins/jnlp-slave:latest

ARG docker_version=19.03.5
ARG docker_compose_version=1.25.1

USER root

# Install docker-ce-cli
RUN apt-get update && apt-get -y install lsb-release \
    && curl -fsSL -o docker-ce-cli.deb \
        https://download.docker.com/linux/debian/dists/$(lsb_release -cs)/pool/stable/amd64/docker-ce-cli_${docker_version}~3-0~debian-stretch_amd64.deb \
    && dpkg -i docker-ce-cli.deb \
    && rm -f docker-ce-cli.deb

# Install docker-compose
RUN curl -fsSL -o /usr/local/bin/docker-compose \
        https://github.com/docker/compose/releases/download/${docker_compose_version}/docker-compose-$(uname -s)-$(uname -m) \
    && chmod +x /usr/local/bin/docker-compose

USER jenkins
