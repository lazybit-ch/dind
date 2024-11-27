ARG DOCKER_VERSION
FROM docker:${DOCKER_VERSION:-27.3.1-dind}

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/local/go/bin:/usr/sbin:/usr/bin:/sbin:/bin

ARG GO_VERSION
ENV GO_VERSION=${GO_VERSION:-1.20.2}

ARG DOCKER_COMPOSE_VERSION
ENV DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION:-2.30.3}

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3002
USER root

RUN apk add --no-cache \
        ca-certificates=20240705-r0 \
        curl=8.11.0-r2 \
        gcc=13.2.1_git20240309-r0\
        git=2.45.2-r0 \
        libffi-dev=3.4.6-r0 \
        make=4.4.1-r2 \
        musl-dev=1.2.5-r0 \
        openssl-dev=3.3.2-r1 \
        python3-dev=3.12.7-r0 \
        py3-pip=24.0-r2

RUN curl -L https://dl.google.com/go/go${GO_VERSION}.src.tar.gz |tar xz -C /usr/local

RUN adduser -S -G root docker

RUN mkdir -p /home/docker/.docker/cli-plugins && \
    chown -R docker:docker /home/docker/.docker && \
    curl -SL https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64 -o /home/docker/.docker/cli-plugins/docker-compose
