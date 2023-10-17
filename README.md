# Zarf Package K3d

Zarf package that deploys a k3d cluster that has GPU support

## Deployment

1. Configure the [zarf config file](./zarf-config.yaml) and [zarf manifest](./zarf.yaml) to be the correct zarf version.
2. Specify the number of GPUs the runtime should have access to in [the k3d script](./scripts/k3d.sh)
3. Follow the instructions below in your CLI:

```bash
zarf package create .
zarf package deploy zarf-package-k3d-local-amd64-v1.27.2.tar.zst
```


### BigBang deployed

```bash
kubectl get hr -n bigbang
```

### Working GPU

```bash
kubectl apply -f image/cuda-vector-add.yaml
kubectl logs -n gpu-test cuda-vector-add      
```

Should return:

```
[Vector addition of 50000 elements]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 196 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
```