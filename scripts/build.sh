#!/usr/bin/env zsh

VERSION=$(git rev-parse --short head)

docker build -t hello-api:$VERSION -t hello-api:latest .
