# Docker in Docker

[Docker](https://www.docker.com) is containerization software designed to make it easier to create, deploy and run applications.

## TL;DR

```console
$ helm repo add lazybit https://chartmuseum.lazybit.ch
$ helm repo update
$ helm install lazybit/dind
```

## Introduction

This chart bootstraps a [Docker in Docker](https://hub.docker.com/_/docker) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

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

This helm chart supports customizing the Docker in Docker `daemon.json` configuration file.

The following tables lists the configurable parameters of the GitHub Actions Runner chart and their default values.

| Parameter | Description | Default |
|-----------|-------------|---------|
| `global.image.pullPolicy` | | `""` |
| `global.image.pullSecrets` | | `[]` |
| `global.image.tag` | | `""` |
| `replicaCount` | | `1` |
| `image.repository` | | `lazybit/dind` |
| `image.pullPolicy` | | `IfNotPresent` |
| `image.pullSecrets` | | `[]` |
| `image.tag` | | `""` |
| `nameOverride` | | `""` |
| `fullnameOverride` | | `""` |
| `serviceAccount.create` | | `true` |
| `serviceAccount.annotations` | | `{}` |
| `serviceAccount.name` | | |
| `podAnnotations` | | `{}` |
| `podSecurityContext` | | `{}` |
| `securityContext.privileged` | | `true` |
| `service.type` | | `ClusterIP` |
| `service.port` | | `2376` |
| `ingress.enabled` | | `false` |
| `ingress.annotations` | | `{}` |
| `ingress.hosts[0].host` | | `chart-example.local` |
| `ingress.hosts[0].paths` | | `[]` |
| `ingress.tls` | | `[]` |
| `resources` | | `{}` |
| `autoscaling.enabled` | | `false` |
| `autoscaling.minReplicas` | | `1` |
| `autoscaling.maxReplicas` | | `100` |
| `autoscaling.targetCPUUtilizationPercentage` | | `80` |
| `nodeSelector` | | `{}` |
| `tolerations` | | `[]` |
| `affinity` | | `{}` |
| `debug` | | `false` |
| `experimental` | | `false` |
| `metrics.enabled` | | `false` |
| `metrics.address` | | `""` |
| `metrics.port` | | `""` |
| `loggingDriver` | | `""` |
| `livenessProbe.enabled` | | `false` |
| `readinessProbe.enabled` | | `false` |
| `kaniko` | | `false` |
| `kanikoSecretName` | | `""` |
| `persistence.enabled` | | `false` |
| `persistence.certs.accessModes` | | `["ReadWriteMany"]` |
| `persistence.certs.size` | | `2Mi` |
| `persistence.certs.annotations` | | `{}` |
| `persistence.workspace.accessModes` | | `["ReadWriteMany"]` |
| `persistence.workspace.size` | | `8Gi` |
| `persistence.workspace.annotations` | | `{}` |
| `persistence.certs` | | `` |
