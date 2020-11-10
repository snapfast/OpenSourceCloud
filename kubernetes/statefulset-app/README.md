Before discussing statefulsets, we discuss about stateful applications.

- Stateful applications save the state of the app. (applications store the data)

Nodejs application + MongoDB database
MongoDb is the stateful application, and nodeJs is stateless.

## Deployment difference in both types

Stateless applications are deployed using Deployment in the kubernetes.
Stateful applications are deployed using Statefulsets.

- Both Deployments and Statefulsets manage the pods and replicas in similar way.
- Storage can be configured in both.
- They differ in the operation. Stateful application replication is more complex.

Stateful applications in the statefulsets, each replica pod
- can't be created and deleted at the same time
- can't be randomly accessed
- replica pods are not identical, they have Pod Identity (Statefulsets)

If a pod dies, new pods is creatd with the same pod ID as before. This particularly helpful for certain kind of applications such as Databases. 
Databases generally have a architecture of master-slave to update the data in the disk. Only one pod is responsible to write the data and others are read only. Each pod has its own separate PV atached. Data is replicated among the Volumes.
PV data is persisted even if one or pods dies simlutaneouly.








