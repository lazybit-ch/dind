ARG DOCKER_VERSION
FROM docker:${DOCKER_VERSION:-23.0.1-dind}

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/local/go/bin:/usr/sbin:/usr/bin:/sbin:/bin

ARG GO_VERSION
ENV GO_VERSION=${GO_VERSION:-1.20.2}

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3002
USER root

RUN apk add --no-cache \
        ca-certificates=20220614-r4 \
        curl=7.88.1-r0 \
        gcc=12.2.1_git20220924-r4 \
        git=2.38.4-r1 \
        libffi-dev=3.4.4-r0 \
        make=4.3-r1 \
        musl-dev=1.2.3-r4 \
        openssl-dev=3.0.8-r0 \
        python3-dev=3.10.10-r0 \
        py3-pip=22.3.1-r1

RUN curl -L https://dl.google.com/go/go${GO_VERSION}.src.tar.gz |tar xz -C /usr/local

RUN python3 -m pip install docker-compose

RUN addgroup -S docker && adduser -S -G root docker
