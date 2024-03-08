# `hello-api`

Super simple hello world API for experimenting, testing, or debugging.

## Build

```sh
# in repo root
docker build -t hello-api .
```

## Deploy

To deploy to a kubernetes cluster, apply the manifests.

```sh
kubectl apply -f k8s
```
