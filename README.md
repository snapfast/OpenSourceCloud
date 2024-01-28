# Production ready in Kubernetes

[Ansible](ansible)  
[AWS](aws)  
[Content Delivery Network](cdn)  
[CKA - Kubernetes](gcp/interview-talk)  
[Google Cloud Platform](gcp)   
[Monitoring](monitoring)   
[Kubernetes](kubernetes)  
[Terraform](terraform)  
[Unix Linux](unix-linux)  


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


[Interview Talk](/OpenSourceCloud/interview-talk)  
[Video about DevOps](https://www.youtube.com/watch?v=0vSKgTGmfUY)

[[Edit Repo]](https://github.com/snapfast/cloud_notes)
