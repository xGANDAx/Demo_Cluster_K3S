#!/bin/sh

NAMESPACE="monitoring"

kubectl create secret generic grafana-secret \
  -n $NAMESPACE \
  --from-literal=admin-user=$ADMIN_USER\
  --from-literal=admin-password=$ADMIN_PASSWORD

