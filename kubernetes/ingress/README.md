## Ingress

Ingress > Service > Pod

- some rules are required to handle the request
- according to these rules the request is forwarded to the service
- http option -- means that the request is forwarded to the internal service
- Service that is used is generally ClusterIP type (default)
- host -- should be mapped correctly
- Need for an Ingress Controller


#### Ingress Controller

Actual Implementation of Ingress

this evaluates all the rules to the cluster; manages the redirections; also is te entrypoint to the cluster; third-party ingress controllers

- One is provided by kubernetes itself; k8s nginx ingress controller

