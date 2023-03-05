#! /bin/bash
kubectl apply -f node-secret.yaml
kubectl apply -f node-deploy.yaml
kubectl apply -f node-service.yaml