#!/bin/bash

helm upgrade --install nfs-server \
    --set persistence.enabled=true \
    --set persistence.size=10Gi \
    --set persistence.storageClass=standard \
    --set storageClass.defaultClass=true \
    --set storageClass.name=nfs-client \
    --set storageClass.mountOptions[0]="vers=4" \
    stable/nfs-server-provisioner \
    --wait

helm install registry stable/docker-registry --wait

helm install dind \
    --set insecureRegistries[0]="registry-docker-registry:5000" \
    --set global.storageClass=nfs-client \
    --set experimental=true \
    --set kaniko=false \
    --set debug=true \
    --set metrics.enabled=true \
    --set metrics.address="0.0.0.0" \
    --set metrics.port="9323" \
    --set persistence.enabled=true \
    --set persistence.certs.accessModes[0]=ReadWriteMany \
    --set persistence.certs.size=1Gi \
    --set persistence.workspace.accessModes[0]=ReadWriteMany \
    --set persistence.workspace.size=8Gi \
    --set resources.requests.memory="1Gi" \
    --set resources.requests.cpu="1" \
    --set resources.limits.memory="2Gi" \
    --set resources.limits.cpu="2" \
    --set livenessProbe.enabled=false \
    --set readinessProbe.enabled=false \
    -f values.yaml \
    --wait \
    .
    # --dry-run \
