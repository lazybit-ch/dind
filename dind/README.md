# Docker in Docker

[Docker](https://www.docker.com) is containerization software designed to make it easier to create, deploy and run applications.

## TL;DR

```console
$ helm install dind
```

## Introduction

This chart bootstraps a [DinD]() deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.15+
- Helm 2.11+ or Helm 3.0-beta3+
- PV provisioner support in the underlying infrastructure

## Installing the Chart
To install the chart with the release name `my-release`:

```console
$ helm install --name dind dind
```

The command deploys Docker in Docker on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

The following tables lists the configurable parameters of the DinD chart and their default values.

| Parameter | Description | Default |
|-----------|-------------|---------|
| `experimental` | Enable Docker experimental features | `false` |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install --name my-release \
    --set image.tag=latest \
    dind
```

The above command sets the Docker in Docker `tag` to `latest`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
$ helm install --name my-release -f values.yaml dind
```

> **Tip**: You can use the default [values.yaml](values.yaml)

### Change DinD version

To modify the DinD version used in this chart you can specify a [valid image tag]() using the `image.tag` parameter. For example, `image.tag=0.0.30`

### daemon.json file as configMap

This helm chart supports customizing the DinD `daemon.json` configuration file.
