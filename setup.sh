#!/bin/bash

docker build -f Dockerfile-build -t auto-setup-build .
docker build -f Dockerfile-pyenv -t auto-setup-pyenv .
