#!/bin/sh

NAMESPACE="n8n"

kubectl delete secret postgres-secret -n $NAMESPACE

kubectl create secret generic postgres-secret \
  --namespace $NAMESPACE \
  --from-literal=POSTGRES_USER=$POSTGRES_USER \
  --from-literal=POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
  --from-literal=POSTGRES_DB=$POSTGRES_DB

kubectl delete secret n8n-secrets -n $NAMESPACE

kubectl create secret generic n8n-secrets -n $NAMESPACE\
  --from-literal=N8N_ENCRYPTION_KEY=$(openssl rand -hex 32) \
  --from-literal=N8N_HOST=localhost \
  --from-literal=N8N_PORT=5678 \
  --from-literal=N8N_PROTOCOL=http