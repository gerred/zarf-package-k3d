#!/bin/bash

set -euxo pipefail

K3S_TAG=${K3S_TAG:="v1.27.3-k3s1"} # replace + with -, if needed
IMAGE_REGISTRY=${IMAGE_REGISTRY:="ghcr.io/runyontr/packages"}
IMAGE_REPOSITORY=${IMAGE_REPOSITORY:="rancher/k3s"}
IMAGE_TAG="$K3S_TAG-cuda"
IMAGE=${IMAGE:="$IMAGE_REGISTRY/$IMAGE_REPOSITORY:$IMAGE_TAG"}

NVIDIA_CONTAINER_RUNTIME_VERSION=${NVIDIA_CONTAINER_RUNTIME_VERSION:="3.13.0"}

echo "IMAGE=$IMAGE"

# due to some unknown reason, copying symlinks fails with buildkit enabled
DOCKER_BUILDKIT=0 docker build \
  --build-arg K3S_TAG=$K3S_TAG \
  --build-arg NVIDIA_CONTAINER_RUNTIME_VERSION=$NVIDIA_CONTAINER_RUNTIME_VERSION \
  -t $IMAGE .
# docker push $IMAGE
echo "Done!"