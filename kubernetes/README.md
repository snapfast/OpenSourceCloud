# Kubernetes

[Ingress](ingress)  
[Prometheus and Grafana](prometheus-grafana)  
[Stateful Set](statefulset-app)



## Load Balancer in Kubernetes

## Why Load Balancer ?
- number of users increase
- number of servers increase
- LoadBalancer is used to distribute the load across all your servers.
- SSL certificate is stored om each server, rather store all certificates on the LB.
- Updating the app without any downtime for application as a whole. Updates, or fixing issues.
- Backup the applications with zero to low downtime.
- Routing to Host/Path can be used for the server.

## Load Balancers
HAProxy, Nginx, F5, Cisco, Avi, Cloud Providers(AWS, GCE, Azure, Do, etc.)

## Load Balancers type
- L4
inspect the packet only upto the TCP/UDP layer
- L7 (Application load balancer)
inspects the packet all the way up to Layer 7 (HTTP/HTTPS)

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


## Why you need load balancing in Kubernetes?
Let us assume, we have 3 node setup, with 3 replica pods of same deployment.
Qeustions: to access, you can use any IP of nodes, but which IP to use? How is the traffic balanced equally among the nodes?

Load Balancer is used in such case. But, creating a load balancer is not cheap by any means. Now, there is a solution to this situation. Ingress to the rescue.

When creating a service of type LoadBalancer, a LB is created for you on the Cloud service provider. I tested this on Linode and it works flawlessly.


Read More...  
https://kubernetes.io/docs/concepts/




