#! /bin/bash

ENV_IMAGE_NAME="fip_firefox_inside_podman"
ENV_IMAGE_TAG="v0.1.1"

ENV_DOCKER_ORG="tekappsrl"
ENV_DOCKER_USER=$1
ENV_DOCKER_PASS=$2

apt install podman -y

podman login docker.io -u $ENV_DOCKER_USER -p $ENV_DOCKER_PASS

podman build -t $ENV_IMAGE_NAME:$ENV_IMAGE_TAG -f Containerfile .

podman push $ENV_IMAGE_NAME:$ENV_IMAGE_TAG docker.io/$ENV_DOCKER_ORG/$ENV_IMAGE_NAME:$ENV_IMAGE_TAG
podman push $ENV_IMAGE_NAME:$ENV_IMAGE_TAG docker.io/$ENV_DOCKER_ORG/$ENV_IMAGE_NAME:latest
