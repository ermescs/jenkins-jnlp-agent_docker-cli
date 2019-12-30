#!/usr/bin/env bash

set -e

docker_version="19.03.5"

if [ "a${1}" != "a" ]; then
    docker_version=${1}
fi

REPO="ermescs/jenkins-jnlp-agent_docker-cli:${docker_version}"
BUILD_ARGS="--build-arg docker_version=${docker_version}"

echo "Building '${REPO}'"

docker build --pull \
    ${BUILD_ARGS} \
    -t $REPO .

read -p "Do you want to push '${REPO}' to the Docker public registry? [yN] " answer
case $answer in
    [yY] )
        docker push ${REPO}
        ;;
    * )
        ;;
esac
