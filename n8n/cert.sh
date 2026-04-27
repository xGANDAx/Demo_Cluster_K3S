NS="n8n"
TLS_CERT="$TLS_CERT"
TLS_KEY="$TLS_KEY"

echo "$TLS_CERT" > cert.pem
echo "$TLS_KEY" > key.pem

if kubectl get secret n8n-tls -n "$NS" &>/dev/null; then
  echo "El secreto ya existe, no se crea"
else
  echo "Creando secreto n8n-tls"
  kubectl create secret tls n8n-tls \
    --cert=cert.pem \
    --key=key.pem \
    -n "$NS"
fi

rm cert.pem key.pem
