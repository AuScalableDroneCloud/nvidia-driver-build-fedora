# Fedora build of NVidia Driver for k8s

This repo consists of the "fedora" folder from the NVidia repo at : https://gitlab.com/nvidia/container-images/driver/

It will provide an automatic image build and upload to the Github container registry at https://github.com/orgs/AuScalableDroneCloud/packages/container/package/driver

We will need to use this for the gpu-operator deployment on our OpenStack Magnum based Kubernetes cluster, at least until NVidia starts building and hosting their own image

Owen Kaluza, Monash University, 18/2/2021

Original README.md content below:

# Fedora [![build status](https://gitlab.com/nvidia/driver/badges/master/build.svg)](https://gitlab.com/nvidia/driver/commits/master)

See <https://github.com/NVIDIA/nvidia-docker/wiki/Driver-containers-(Beta>)

Building and running locally:

```
DRIVER_VERSION=510.47.03
FEDORA_VERSION=32
sudo podman build \
    --build-arg FEDORA_VERSION=$FEDORA_VERSION \
    --build-arg DRIVER_VERSION=$DRIVER_VERSION \
    -t docker.io/nvidia/driver:$DRIVER_VERSION-fedora$FEDORA_VERSION .
sudo podman run --name nvidia-driver --privileged --pid=host \
    -v /run/nvidia:/run/nvidia:shared \
    docker.io/nvidia/driver:$DRIVER_VERSION-fedora$FEDORA_VERSION \
    --accept-license
```
