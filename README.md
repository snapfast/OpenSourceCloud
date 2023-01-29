# Production ready in Kubernetes

[Ansible](/OpenSourceCloud/ansible)  
[AWS](/OpenSourceCloud/aws)  
[Content Delivery Network](/OpenSourceCloud/cdn)  
[CKA - Kubernetes](/OpenSourceCloud/gcp/interview-talk)  
[Google Cloud Platform](/OpenSourceCloud/gcp)   
[Kubernetes](/OpenSourceCloud/kubernetes)  
[Terraform](/OpenSourceCloud/terraform)  
[Unix Linux](/OpenSourceCloud/unix-linux)  


Securing the API, k8s cluster
 - use namespaces
 - RBAC
 - DEV read access, Operator RW access
 - CI / CD pipeline only way to update the k8s cluster
 - Ensure process, validation, vulnerability detection on the CI / CD pipeline.
 - use Daemonsets to check intrusion detection / vulnerability on the Kubernetes cluster itself.
 - Monitoring correct working services on the cluster using daemonsets
 - Run Failover tests with practice in another region
 - need for proper health checks to efficiently run failover.
 - use a datastore for failover data replication across regions like CosmosDB, CloudStorage(gcp)


https://www.youtube.com/watch?v=0vSKgTGmfUY

