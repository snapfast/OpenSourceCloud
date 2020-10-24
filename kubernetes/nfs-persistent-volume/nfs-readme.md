# Persist data in the kubernetes using volumes

- Persistent Volume
- Persistent Volume Claim
- Storage Class

##### Storage requirements in k8s cluster
Need for storage to persist without dependency on the pod lifecycle
Storage availablity on all nodes
Storage needs to survive even if cluster crashes

---

Persistent Volume - created using YAML file
Actual storage can reside anywhere, and needs to be managed and maintained separately from existing kubernetes cluster or persistent volumes.
- NFS storage
- Cloud Block Storage
- Local Disk on the Nodes

* PV are not in any namespace. They are available to the whole cluster.
* Use remote storage in most scenarios, especially in case of DB. SHould not be tied to a node, should survive the cluster crashes.


