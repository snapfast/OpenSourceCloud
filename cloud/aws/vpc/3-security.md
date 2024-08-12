# Security - Security groups - Network access control list - Flow logs

#### Security group
- Network firewalls of AWS
- Security groups follow application structure -- Frontend servers allow internet -- Backend servers block internet
- Backend servers talk to frontend Security group
- supports allow rules only
- return traffic is automatically allowed regardless of any rules : stateful

#### Network control lists
- Operates at Subnet level
- supports allow and deny rules
- return traffic must be explicitly allowed by rules : stateless
- try to keep NACLs simple, they are coarse grain control

#### Flow logs
- works at VPC level, subnet level or at instance level
- write output to S3 bucket or cloudwatch logs
- provides visibility into the network
- flow logs do not contain the packet data, only information about the packets


