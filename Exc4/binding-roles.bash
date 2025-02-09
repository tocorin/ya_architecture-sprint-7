#!/bin/bash

kubectl apply -f viewer-binding.yaml
kubectl apply -f cluster-configurator-binding.yaml
kubectl apply -f privileged-admin-binding.yaml

