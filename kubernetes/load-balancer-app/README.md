# Load Balancer in Kubernetes

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
- L4 (Network Load Balancer)
inspect the packet only upto the TCP/UDP layer
- L7 (Application load balancer)
inspects the packet all the way up to Layer 7 (HTTP/HTTPS)


## Why you need load balancing in Kubernetes?
Let us assume, we have 3 node setup, with 3 replica pods of same deployment.
Qeustions: to access, you can use any IP of nodes, but which IP to use? How is the traffic balanced equally among the nodes?

Load Balancer is used in such case. But, creating a load balancer is not cheap by any means. Now, there is a solution to this situation. Ingress to the rescue.

When creating a service of type LoadBalancer, a LB is created for you on the Cloud service provider. I tested this on Linode and it works flawlessly.


> issue: Stuck while creating a Deployment on "CreatingContainer"
