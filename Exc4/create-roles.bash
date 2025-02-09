#!/bin/bash

kubectl apply -f viewer-role.yaml
kubectl apply -f cluster-configurator-role.yaml
kubectl apply -f privileged-admin-role.yaml
