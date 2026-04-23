#!/bin/sh
cd manifests
kubectl apply -f pvc.yaml
kubectl apply -f grafana-config.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml
kubectl apply -f prome-pvc.yaml
kubectl apply -f prome-config.yaml
kubectl apply -f prome-deployment.yaml
kubectl apply -f prome-service.yaml
