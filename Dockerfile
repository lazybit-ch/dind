ARG DOCKER_VERSION
FROM docker:${DOCKER_VERSION:-23.0.1-dind}

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/local/go/bin:/usr/sbin:/usr/bin:/sbin:/bin

ARG GO_VERSION
ENV GO_VERSION=${GO_VERSION:-1.20.2}

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3002
USER root

RUN apk add --no-cache \
        ca-certificates=20191127-r4 \
        curl=7.69.1-r1 \
        gcc=9.3.0-r2 \
        git=2.26.2-r0 \
        libffi-dev=3.3-r2 \
        make=4.3-r0 \
        musl-dev=1.1.24-r9 \
        openssl-dev=1.1.1g-r0 \
        python3-dev=3.8.5-r0 \
        py3-pip=20.1.1-r0

RUN curl -L https://dl.google.com/go/go${GO_VERSION}.src.tar.gz |tar xz -C /usr/local

RUN python3 -m pip install docker-compose

RUN addgroup -S docker && adduser -S -G root docker
