## Prometheus

Prometheus server
- Time series database----CPU usage, No of exceptions
- Data Retrieval Worker - Applications, pulls the metric data from services, etc. 
- Web Server - Server API - dashboad accepts PromQL queries

Targets, Units

Monitor Linux, Apache Server, Single Applicaations, service like Database,
Targets has units to measure. 
Human readable metrics

Exporter - scrapes and exports data from the application.
Prometheus is pull based monitoring solution. It can also do push with some configuration.
Data is received on the /metrics endpoint of each application.
Type -- 3 metrics types

---
When you install helm 3 chart, this happens

`helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`

`helm install [RELEASE_NAME] prometheus-community/kube-prometheus-stack`

2 Stateful Sets - 1 prometheus, 1 alertmanager
3 deployments - 1 grafana, 1 promethus operator, kube state metrics(out of the box)
1 daemonset - Node Exporter - runs on the every single worker Node(daemonset) - translates all data into prometheus data for prometheous to be scraped
several services, several pods
multiple configmap, secrets are created


CRD - custom resource definitions
Prometheus includes crd pre built.

---

Sample application mongodb exposed to be monitored by prometheus, grafana. Pull metrics are gathered. Prometheus server finds the exporters and targets.
- Deploy mongodb
- Deploy mongodb Exporter
- Deploy ServiceMonitor

Create Prometheus UI, Grafana using PromQL.

- Port Forward to view the service on local.
kubectl port-forward service/prometheus-kube-prometheus-prometheus 9090


--- 
There are many supported exporters for prometheus.
https://prometheus.io/docs/instrumenting/exporters/

We get a mongodb exporter. Docker image for the mongo exporter.

---
Deploying an exporter

- Exporter application
- Expose the /metrics endpoint
- Service is required to connect.
- Service Monitor to be created. For discovery by Prometheus.

Prometheus must know the application is present to enable scraping. Create service monitor.

Configurations can be configured using a helm chart.
https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus-mongodb-exporter

this chart is used.

- When creating a new service monitor, tag for `release: prometheus` needs to be added. Then prometheus can recognize the the service monitor.


`kubectl port-forward deployment/prometheus-grafana 3000`

`kubectl port-forward service/prometheus-kube-prometheus-prometheus 9090`


