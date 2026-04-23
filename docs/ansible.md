# 🚀 Raspberry Pi DevOps Setup con Ansible

## 📌 Descripción

Este proyecto automatiza la configuración de una Raspberry Pi utilizando Ansible para desplegar:

* ☸️ K3s (Kubernetes ligero)
* 🤖 GitHub Actions Runner (self-hosted)
* 📊 Node Exporter (métricas para Prometheus)
* 🌐 Cloudflare Tunnel (cloudflared en Kubernetes)

---

## 🧩 Arquitectura

### 🖥️ Host (Raspberry Pi)

* Instalación de dependencias
* Configuración de K3s
* Instalación de GitHub Runner
* Instalación de Node Exporter
* Configuración de entorno Python (virtualenv)

### ☸️ Cluster (K3s)

* Creación de namespace para cloudflared tunnel
* Deployment de cloudflared

---

## 📁 Estructura del proyecto

```
ansible/
├── inventory.ini
├── playbook.yml
├── secrets.yml
└── roles/
    ├── common/
    ├── k3s/
    ├── github_runner/
    ├── node_exporter/
    └── k8s_deploy/
```

---

## ⚙️ Inventory

En este archivo se define el servidor de destino, en este caso la Raspberry Pi

## 🔐 Manejo de secretos

Se utiliza Ansible Vault para proteger 3 secretos:

* **github_token**: Token utilizado por la configuracion del self-hosted runner de Github. 
* **tunnel_token**: Token utilizado para conectar el tunnel con cloudflare.
* **ansible_become_pass**: Contraseña sudo para el usuario pi.

### Creacion:
```
ansible-vault create secrets.yml
```


---

## ▶️ Playbook principal

Definicion del flujo principal, en donde se indica en que host se va a ejecutar, que roles va a ejecutar y el orden de ejecucion.

---

## 📦 Roles

### 🧱 common

* Actualiza el sistema
* Instala dependencias base
* Crea virtualenv en `/opt/ansible-venv`
* Instala dependencias Python:

  * kubernetes
  * packaging
  * requests
  * urllib3
  * pyyaml

---

### ☸️ k3s

* Instala K3s
* Habilita el servicio
* Copia kubeconfig a `/home/pi/.kube/config`

---

### 🤖 github_runner

* Descarga el runner
* Configura con token
* Instala como servicio systemd

Notas:

* Se ejecuta como usuario `pi`
* Se corrigen permisos del directorio

---

### 📊 node_exporter

* Descarga el binario
* Configura servicio systemd
* Expone métricas del host

---

### 🚀 k8s_deploy

* Crea namespace `cloudflared`
* Crea Secret con `tunnel_token`
* Despliega cloudflared en Kubernetes

---

## ▶️ Ejecución

```
ansible-playbook -i inventory.ini playbook.yml --ask-vault-pass
```

---

## 🧪 Verificación

```
kubectl get nodes
kubectl get pods -A
kubectl get pods -n cloudflared
```

---


## 🧠 Conclusión

Este proyecto permite:

* Automatizar infraestructura con Ansible
* Ejecutar Kubernetes en Raspberry Pi
* Integrar CI/CD con runner local
* Exponer servicios mediante túnel seguro
