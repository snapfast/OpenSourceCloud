# Kubernetes

[Ingress](ingress)  
[Prometheus and Grafana](prometheus-grafana)  
[Stateful Set](statefulset-app)  
[Load Balancer App](load-balancer-app)  
[NFS Persistent Volume](nfs-persistent-volume)  
[Some Deployment YAML](old_files)  


## In Kubernetes
DNS Pod is responsible for the Service Discovery in the Kubernetes Cluster.

### Cluster IP
Provides Load distribution, version upgrades. Use ClusterIP to expose your application.
It is L4 load balcncing. It is Internal to the cluster. Configured via K8S service. Service Discovery using the name of the service. No network interfaces associated to the ClusterIP.

#### Service Discovery
As part of Cluster IP, service discovery is available.
- Within same namespace, services are discoverable using their names.
- Default Domain -> cluster.local
- service-name,  service-name.namespace-name, service-name.namespace-name.svc.cluster.local

### Create Cluster IP with appication
Create a deployment of your application, create a Service of type ClusterIP using selector labels for the app.
Use targetPort in ClusterIP and containerPort in Deployment; for binding the two objects.
Port on ClusterIP is actual port that is exposed outside.

### DaemonSet
For simulating the client app.


Read More...  

[https://kubernetes.io/docs/concepts/](https://kubernetes.io/docs/concepts/)



