#!/bin/bash

kubectl config set-credentials user1 --client-certificate=/path/to/user1.crt --client-key=/path/to/user1.key
kubectl config set-credentials user2 --client-certificate=/path/to/user2.crt --client-key=/path/to/user2.key
kubectl config set-credentials admin-user --client-certificate=/path/to/admin-user.crt --client-key=/path/to/admin-user.key


