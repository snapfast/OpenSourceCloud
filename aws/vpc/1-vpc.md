## VPC (Virtual Private Network)

#### VPC is a virtual network. Software defined network.

Features:
- Every VPC has a internet gateway.
- Network ACL, Route Table gets created.
- One VPC can be across the multiple AZ in a region.
- 5 VPC, and 200 subnets per VPC
- Public subnet EC2 machine has internet access.
- NAT gateway is managed service. NAT instance is you have to manage.
- Network ACL is on the subnet level. Security Group applied at instance level.

---

> To find the subnet, if public subnet or private subnet:

Check the route table for the subnet. If the Route Table has Internet Gateway mentioned, then the subnet is Public subnet. Otherwise, you would find a NAT gateway for the private subnet.

> To check the ACL rules:

Check the Network ACL rules for the VPC, first rule is applied to the VPC.

#### Create a VPC

```
aws ec2 create-vpc --cidr-block 10.0.0.0/16 --no-amazon-provided-ipv6-cidr-block --dry-run
```

#### Create a Public Subnet

```
aws ec2 create-subnet --vpc-id vpc-xxxxx --cidr-block 10.0.10.0/26
aws ec2 create-internet-gateway
aws ec2 attach-internet-gateway --vpc-id vpc-xxxxx --internet-gateway-id idw-xxx
aws ec2 create-route-table --vpc-id vpc-xxxxx
aws ec2 create-route --route-table-id rtb-xxx --destination-cidr-block 0.0.0.0/0 --gateway-id igw-xxx

# confirmation
aws ec2 describe-route-tables --route-table-id rtb-xxx

# search subnets using queries and filters
aws ec2 describe-subnets --filters "Name=vpc-id,Values=vpc-xxx" --query 'Subnets[*].{ID:SubnetId,CIDR:CidrBlock}'

# associate subnet with route table
aws ec2 associate-route-table --subnet-id subnet-xxx --route-table-id rtb-xxx

# automatically assign public ip on instance launch
aws ec2 modify-subnet-attribute --subnet-id subnet-xxx --map-public-ip-on-launch
```

#### Create a Private VPC

```
aws ec2 create-subnet --vpc-id vpc-xxx --cidr-block 10.0.0.0/24
aws ec2 allocate-address --domain vpc --network-border-zones "availability zones, local zones"
aws ec2 create-nat-gateway --subnet-id subnet-xxx --allocation-id eipalloc-xxx
aws ec2 create-route-table --vpc-id vpc-xxx
aws ec2 create-route --route-table-id rtb-xxx --destination-cidr-block 0.0.0.0/0 --nat-gateway-id nat-xxx

```




