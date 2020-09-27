#!/bin/bash

DOCKER_VERSION="19.03.13-dind"
VERSION=${VERSION}

# Build and push to lazybit.ch
docker build --rm --pull --build-arg DOCKER_VERSION=${DOCKER_VERSION} -t lazybit.ch/dind:latest .
docker push lazybit.ch/dind:latest

# Push to GitHub Packages
docker tag lazybit.ch/dind:latest ghcr.io/lazybit-ch/dind:latest
docker push ghcr.io/lazybit-ch/dind:latest

# Push to Public Docker Hub
docker tag lazybit.ch/dind:latest lazybit/dind:latest
docker push lazybit/dind:latest

CHART_VERSION=$(echo "$VERSION" | -e "s/v//g")
pushd dind
if [ -f dind-${CHART_VERSION}.tgz ]; then
    rm dind-${CHART_VERSION}.tgz
fi
helm package --app-version=${VERSION} --version=${CHART_VERSION} .
helm push dind-${CHART_VERSION}.tgz lazybit --force
