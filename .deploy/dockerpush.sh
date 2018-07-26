#!/bin/bash
set -e

echo "Building docker image"
echo "############################"
docker build -t $DOCKER_REPO:$CIRCLE_SHA1 .

echo "Logging into docker"
echo "############################"
#docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASSWD
docker login -u $DOCKER_USER -p $DOCKER_PASSWD

echo "Pushing docker image"
echo "############################"
#docker push $DOCKER_REPO:$CIRCLE_SHA1
#docker tag $DOCKER_REPO:$CIRCLE_SHA1 $DOCKER_REPO:latest
#docker push $DOCKER_REPO:latest
