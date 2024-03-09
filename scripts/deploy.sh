#!/usr/bin/env zsh

while (( $# )); do
  case $1 in
    -f|--force) force=true;;
  esac
  shift
done

kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
envsubst < k8s/ingress.yaml | kubectl apply -f -

VERSION=$(git rev-parse --short head)
kubectl set image deployments/hello-api-deployment hello-api=hello-api:$VERSION

if [[ -n "$force" ]]; then
  kubectl rollout restart deploy hello-api-deployment
fi
