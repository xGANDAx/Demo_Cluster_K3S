# Stack de Monitoreo: Grafana + Prometheus 📈

Esta infraestructura de monitoreo se basa en **Prometheus** y **Grafana**, desplegados sobre el **cluster K3s**.

## ¿Qué es Prometheus? 🧠
**Prometheus** es el motor de recolección y almacenamiento de métricas. Se encarga de:
- hacer *scrape* (recolección) periódica de métricas desde endpoints expuestos,
- conservar series temporales,
- y permitir consultas mediante **PromQL**.

## ¿Qué es Grafana? 📊
**Grafana** es la plataforma de visualización y análisis. Se utiliza para:
- consultar métricas desde Prometheus,
- construir dashboards por servicio/componentes,
- y configurar alertas (si se habilita en el stack).

## Despliegue en K3s y Node Exporter en Raspberry Pi 🐋
En este entorno:
- Los **servicios de monitoreo** corren dentro del **cluster K3s**.
- En la **Raspberry Pi** existe un **Node Exporter** instalado, cuyo objetivo es exponer métricas del host (CPU, memoria, disco, red, etc.) hacia Prometheus.
- Con esa información, Grafana muestra la salud y el comportamiento del sistema en tiempo casi real.

## Dashboard unificado 🧾
Existe un **dashboard** (o conjunto de dashboards) donde puedes observar toda la información de monitoreo, agregando:
- métricas del cluster (según lo configurado),
- métricas del host vía Node Exporter,
- y visualizaciones operativas para identificar cuellos de botella o degradaciones.


![Mockup del dashboard Grafana](https://storage.googleapis.com/xgandax-documentacion/grafana-drashboard)

## Próximos pasos 🚀 
- Agregar paneles por servicio del cluster.
- Configurar alertas.
- Versionar dashboards.